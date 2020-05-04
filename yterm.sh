#!/bin/bash
#/usr/share/vim/vimfiles/plugin --> vim functions
while [ 1==1 ]
do
clear
echo > yterm.txt #empty last user search html file
printf "
 __      __        ________                                
|  \    /  \      |        \                               
 \▓▓\  /  ▓▓       \▓▓▓▓▓▓▓▓ ______   ______  ______ ____  
  \▓▓\/  ▓▓ ______   | ▓▓   /      \ /      \|      \    \ 
   \▓▓  ▓▓ |\     \  | ▓▓  |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\ ▓▓▓▓▓▓\▓▓▓▓\\
    \▓▓▓▓   \▓▓▓▓▓▓  | ▓▓  | ▓▓    ▓▓ ▓▓   \▓▓ ▓▓ | ▓▓ | ▓▓
    | ▓▓             | ▓▓  | ▓▓▓▓▓▓▓▓ ▓▓     | ▓▓ | ▓▓ | ▓▓
    | ▓▓             | ▓▓   \▓▓     \ ▓▓     | ▓▓ | ▓▓ | ▓▓
     \▓▓              \▓▓    \▓▓▓▓▓▓▓\▓▓      \▓▓  \▓▓  \▓▓


Search: "
read e # read user search

curl https://www.youtube.com/results?search_query=${e// /+} > yterm.txt # puts search in link and replaces whitespaces with '+'
vim yterm.txt -c ":call GetLinks()" -c ":normal ZZ"    # vim script finds all titles & URLs
clear
printf "
														▀▄▀    ▀█▀ ██▀ █▀▄ █▄ ▄█
														 █  ▀▀  █  █▄▄ █▀▄ █ ▀ █
"
awk 'NR % 2 == 0' yterm.txt
printf "\nchoose a video (1-9) and format (v, a, d, da): " # Example: 5v (v=video, a=audio, d=download, da=download audio only)

read v # read user choice of video and format

num="${v:0:1}" # first char in $v is the video number selected
form="${v:1:3}" # last chars in $v are for selected format

numSearch=$((num + num - 1)) # finds the line num of desired video from yterm.txt

link=$(cat yterm.txt | awk 'NR == '$numSearch'') # create the create the link to the desired video
yt="https://www.youtube.com"
echo "${yt}${link}" # concatenate link to youtube in order to search

if [ $form = "a" ]; then 
mpv --video=no "${yt}${link}"
elif [ $form = "d" ]; then
youtube-dl "${yt}${link}"
elif [ $form = "da" ]; then
youtube-dl -x "${yt}${link}"
elif [ $form = "v" ]; then
mpv "${yt}${link}"
fi
done
