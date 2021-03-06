# Y-Term - A Very Lightweight Terminal Based Youtube Application

This 2.3 KB application does not use the YouTube API and it is ad free.
You can watch videos, listen to audio only, download videos or download audio only.
It is still a work in progress but it runs! Features will continue to be added. 
It works with a Vim script I made that parses (crawls/scrapes) youtube search pages to find the titles and URLs. 

![Y-Term](https://user-images.githubusercontent.com/64742558/80999642-9d69df80-8e0a-11ea-8ec9-6eef9a0b6b11.png)
![y-term-video](https://user-images.githubusercontent.com/64742558/80999644-9e9b0c80-8e0a-11ea-851b-a814cfb39f72.png)

## How to use: 
1) put the .vim file in your /usr/share/vim/vimfiles/plugin directory 
2) put the .sh file anywhere you want and create a file called yterm.txt in the same directory 

## Note: you must have the following installed for it to work (or you can mod the code to work with other programs)
(most UNIX based OSs come preinstalled with almost, if not all of these programs)
- bash terminal
- vim
- mpv media player (or any, just edit code to use whatever player you want)
- ffmpeg
- youtube-dl
- curl
- .vim file must be in /usr/share/vim/vimfiles/profiles
- yterm.txt & yterm.sh files must share the same directory 

## How it works - behind the scenes: 
1) user inputs search
2) curl gets html of that youtube search page 
3) Vim parses through and finds titles and URLs 
4) shell prints Vim results (titles)
5) user selects a video using a number (1-9) and a format (a - audio only, v -video and audio, d - download, da - download audio only)
6) mpv media player launches video/audio OR youtube-dl downloads video/audio

### Fun facts: 
- the Vim script parses through the entire youtube search html in a few miliseconds (too fast for me to time it) - a lot faster than youtube itself.
