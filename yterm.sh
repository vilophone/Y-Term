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
#e="hello" # for time testing purposes

curl https://www.youtube.com/results?search_query=${e// /+} > yterm.txt # puts search in link and replaces whitespaces with '+'
vim yterm.txt -c ":call GetLinks()" -c ":normal ZZ"    # vim script finds all titles & URLs
clear
printf "
														▀▄▀    ▀█▀ ██▀ █▀▄ █▄ ▄█
														 █  ▀▀  █  █▄▄ █▀▄ █ ▀ █
"
awk 'NR % 2 == 0' yterm.txt
printf "\nchoose a video (1-9) and format (v, a, d, da): " # Example: 5v (v=video, a=audio, d=download, da=download audio only)

#: <<'END' # for time testing purposes
read v
#v=1a # for time testing purposes

num="${v:0:1}"
form="${v:1:3}"

numSearch=$((num + num - 1)) # finds the line num of desired video 

link=$(cat yterm.txt | awk 'NR == '$numSearch'') # create the create the link to the desired video
yt="https://www.youtube.com"
echo "${yt}${link}" # concatenate link to youtube in order to search

if [ $form = "a" ]; then 
mpv --video=no "${yt}${link}"
elif [ $form = "d" ]; then
youtube-dl "${yt}${link}"
elif [ $form = "da" ]; then
youtube-dl -x "${yt}${link}"
elif [ $form = "t" ]; then		#goofs
mpv "${yt}${link}" -vo tct
#elif [ $form = "n" ]; then
#vim ytermEdit.txt -c ":e yterm.txt" -c ":call Get()" -c ":normal ZZ"
elif [ $form = "v" ]; then
vlc "${yt}${link}"
fi
done
#END
