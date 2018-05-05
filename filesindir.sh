#! /bin/bash

files=($HOME/.slackteams/*)

# echo "${files[@]}"

for i in "${!files[@]}"; do
  printf "%s\t%s\n" "$((i + 1))" "${files[$i]##*/}"
done

read -p "Enter a number to load the workspace or Enter to exit: " answer

if [ ${answer:-0} -lt 1 ] && [ ${answer:-100} -gt ${#files[@]} ]; then
  printf "%s\n" "Exiting"
  exit 0
fi

swapfile() {
  echo "${files[$1]}"
  rm ~/.slack_token
  cp ${files[$1]} ~/.slack_token
}

swapfile "$((answer - 1))"

#slackadaisical

