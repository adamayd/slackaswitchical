#! /bin/bash

files=($HOME/.slackteams/*)

# echo "${files[@]}"

for i in "${!files[@]}"; do
  printf "%s\t%s\n" "$((i + 1))" "${files[$i]##*/}"
done

read -p "Enter a number to load the workspace or any other key to exit: " answer

#if [$answer -lt 1] && [$answer -gt ${#files[@]}]; then
#  printf "%s\n" "Exiting"
#  exit 0
#fi

swapfile() {
  echo "${files[$1]}"
  rm ~/.slack_token
  cp ${files[$1]} ~/.slack_token
}

swapfile "$((answer - 1))"

#slackadaisical

