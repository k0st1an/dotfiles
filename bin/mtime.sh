#!/bin/bash

if ! command -v gdate &>/dev/null; then
  echo "❌ 'gdate' not found. Install it via 'brew install coreutils'"
  exit 1
fi

ADD_NEWLINE=false

if [[ $1 == "-n" ]]; then
  ADD_NEWLINE=true
  shift
fi

if [ $# -eq 0 ]; then
  echo "Usage: $(basename "$0") [-n] <command with args>"
  exit 1
fi

START=$(gdate +%s%N)

# Run the command
"$@"
EXIT_CODE=$?

END=$(gdate +%s%N)
ELAPSED_NS=$((END - START))
ELAPSED_SEC=$(echo "scale=6; $ELAPSED_NS / 1000000000" | bc)

# Get integer part of seconds
ELAPSED_INT_SEC=${ELAPSED_SEC%.*}
H=$((ELAPSED_INT_SEC / 3600))
M=$(((ELAPSED_INT_SEC % 3600) / 60 ))
S=$(printf "%.4f\n" "$(echo "$ELAPSED_SEC - ($H * 3600 + $M * 60)" | bc)")

if $ADD_NEWLINE; then
  echo
fi

if (( H > 0 )); then
  echo "⏱️ Duration: ${H}h${M}m${S}s"
elif (( M > 0 )); then
  echo "⏱️ Duration: ${M}m${S}s"
else
  echo "⏱️ Duration: ${S}s"
fi

exit $EXIT_CODE
