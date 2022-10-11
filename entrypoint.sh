#!/bin/sh

set -e

configPath="./"
indentSpaces=2
files="**/**.scss"
allowEmptyInput="--allow-empty-input"
fullCheck=false
formatter="--formatter=github"
stylelint_path="node_modules/.bin/stylelint"

if [ -n "${CONFIG_PATH}" ]; then
  configPath=$CONFIG_PATH
fi
if [ -n "${INDENT_SPACES}" ]; then
  indentSpaces=$INDENT_SPACES
fi
if [ -n "${FILES}" ]; then
  files=$FILES
fi
if [ -n "${FULL_CHECK}"  ]; then
  fullCheck=$FULL_CHECK
fi

if [ ! -e stylelint_path ]; then
  yarn add stylelint stylelint-config-standard --silent
fi

if [ ! "$(echo ${configPath}.stylelintrc*)" != "${configPath}.stylelintrc*" ]; then
  echo "{
    \"extends\": \"stylelint-config-standard\",
    \"rules\": {
      \"indentation\": "$indentSpaces"
    }
  }" > .stylelintrc
fi

echo "---"
echo "stylelint_path -> ${stylelint_path}"
echo "configPath     -> ${configPath}"
echo "indentSpaces   -> ${indentSpaces}"
echo "files          -> ${files}"
echo "fullCheck      -> ${fullCheck}"
echo "---"

if [ -n "${FILES}" ] || [ "${fullCheck}" = "true" ]; then
  sh -c "$stylelint_path $files $formatter $allowEmptyInput"
fi
