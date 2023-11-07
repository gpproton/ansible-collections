#!/usr/bin/env bash

# heading
# -----------------------------------
# Print standard heading
# -----------------------------------
heading() {
  echo "Personal Collections"
}

# repeat
# -----------------------------------
# Repeat a Character N number of times
# -----------------------------------
repeat(){
  local times="${1:-80}"
  local character="${2:-=}"
  local start=1
  local range
  range=$(seq "$start" "$times")
  local str=""
  # shellcheck disable=SC2034
  for i in $range; do
    str="$str${character}"
  done
  echo "$str"
}

# lintWarning
# -----------------------------------
# Output a Lint Warning Message
# -----------------------------------
lintWarning() {
  local msg="${1}"
  local color_warning="\\x1b[33m"
  local color_reset="\\x1b[0m"
  local bold="\\x1b[1m"
  echo -e "    ‣ ${color_warning}${bold}[warn]${color_reset}  $msg"
}

# lintError
# -----------------------------------
# Output a Lint Error Message
# -----------------------------------
lintError() {
  local msg="${1}"
  local color_error="\\x1b[31m"
  local color_reset="\\x1b[0m"
  local bold="\\x1b[1m"
  echo -e "    ‣ ${color_error}${bold}[error]${color_reset} $msg"
}