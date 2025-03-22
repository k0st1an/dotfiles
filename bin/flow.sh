#!/bin/bash

set -e

FLOWRC=${FLOWRC:-~/.flowrc}

# shellcheck source=/dev/null
test -e "$FLOWRC" && source "$FLOWRC"

if [[ "$1" == "git" ]]; then
  shift

  if [[ -n "$1" ]]; then
    BRANCH_NAME="$1"
  else
    echo "branch name is not set"
    exit 1
  fi

  test ! -x "$(whereis -q git)" && echo "git is not installed" && exit 1
  test ! -d .git && echo "directory .git not found" && exit 1

  git branch -D "$BRANCH_NAME"
  git branch -dr origin/"$BRANCH_NAME"

  echo "Branch $BRANCH_NAME deleted locally and remotely."
  exit
fi

if [[ "$1" == "chc" ]]; then
  shift

  test ! -x "$(whereis -q docker)" && echo "docker is not installed" && exit 1

  if [[ -n "$*" ]]; then
    CLICKHOUSE_ARGS="$*"
  else
    test -z "$CLICKHOUSE_ARGS" && echo "usage: -h ... [options] or define CLICKHOUSE_ARGS in $FLOWRC" && exit 1
  fi

  if [[ -n "$CLICKHOUSE_HISTORY_ENABLED" ]]; then
    test -f ~/.clickhouse-client-history || touch ~/.clickhouse-client-history
    CLICKHOUSE_HISTORY_FILE="-v $HOME/.clickhouse-client-history:/root/.clickhouse-client-history"
  fi

  # shellcheck disable=SC2086
  docker run --rm -it --network host $CLICKHOUSE_HISTORY_FILE --entrypoint clickhouse-client clickhouse $CLICKHOUSE_ARGS
  exit
fi

echo "Usage: flow.sh [command] ..."
echo "Commands:"
echo "  git branch_name   Manage git branches"
echo "  chc [-h ...]      Connect to ClickHouse"
echo "  help              Show this help message"
