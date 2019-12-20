#/usr/bin/env bash

_gws_completions()
{
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  local commands_number=${GWS_COMPLETION_COMMANDS_NUMBER:-50}
  local IFS=$'\n'
  local suggestions=($(compgen -W "$(ls $GIT_WORKSPACE | sed 's/\t//')" -- "${COMP_WORDS[1]}"))

  if [ "${#suggestions[@]}" == "1" ]; then
    local number="${suggestions[0]/%\ */}"
    COMPREPLY=("$number")
  else
    COMPREPLY=("${suggestions[@]}")
  fi
}

complete -F _gws_completions gws