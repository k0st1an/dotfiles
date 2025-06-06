#!/bin/bash

set -e

FLOWRC=${FLOWRC:-~/.flowrc}

# shellcheck source=/dev/null
test -e "$FLOWRC" && source "$FLOWRC"

function usage() {
  echo "Usage: flow.sh [command] ..."
  echo "Commands:"
  echo "  gr branch_name    delete branch"
  echo "  grb               rebase main branch"
  echo "  cc [-h ...]       Connect to ClickHouse"
  echo "    available variables in $FLOWRC:"
  echo "      CLICKHOUSE_ARGS"
  echo "      CLICKHOUSE_HISTORY_ENABLED (default: false)"
  echo "      CLICKHOUSE_VERSION (default: latest)"
  echo "  help              Show this help message"
}

if [[ "$1" == "help" || "$1" == "" ]]; then
  usage
  exit
fi

if [[ "$1" == "gr" ]]; then
  shift

  if [[ -n "$1" ]]; then
    BRANCH_NAME="$1"
  else
    echo "branch name is not set"
    exit 1
  fi

  test ! -x "$(which git)" && echo "git is not installed" && exit 1
  test ! -d .git && echo "directory .git not found" && exit 1

  git branch -D "$BRANCH_NAME"
  git branch -dr origin/"$BRANCH_NAME"
  EXIT_CODE=$?

  echo "Branch $BRANCH_NAME deleted locally and remotely."
  exit $EXIT_CODE
fi

if [[ "$1" == "grb" ]]; then
  git fetch origin main
  git rebase -v origin/main
  exit $?
fi

if [[ "$1" == "cc" ]]; then
  shift

  test ! -x "$(which docker)" && echo "docker is not installed" && exit 1

  if [[ -n "$*" ]]; then
    CLICKHOUSE_ARGS="$*"
  else
    test -z "$CLICKHOUSE_ARGS" && echo "usage: -h ... [options] or define CLICKHOUSE_ARGS in $FLOWRC" && exit 1
  fi

  if [[ -n "$CLICKHOUSE_HISTORY_ENABLED" ]]; then
    test -f ~/.clickhouse-client-history || touch ~/.clickhouse-client-history
    CLICKHOUSE_HISTORY_FILE="-v $HOME/.clickhouse-client-history:/root/.clickhouse-client-history"
  fi

  CLICKHOUSE_VERSION=${CLICKHOUSE_VERSION:-latest}

  # shellcheck disable=SC2086
  docker run --rm -it --network host $CLICKHOUSE_HISTORY_FILE --entrypoint clickhouse-client clickhouse:$CLICKHOUSE_VERSION $CLICKHOUSE_ARGS
  exit $?
fi

usage
