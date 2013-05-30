cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\
ffmpeg64\bin\ffmpeg -i K:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 4 -t 29 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 4 -i K:\introtolean\interviews\AA035101.MXF -frames:v 883 -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:160:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i audio.mp3 -vcodec copy -acodec copy -y K:\introtolean\interviews\AA035101.MXF_000000004_crop.mp4
REM cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\ 
REM del audio.mp3 
REM del crop_audio.mp3 
REM del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i K:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 34 -t 26 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 34 -i K:\introtolean\interviews\AA035101.MXF -frames:v 773 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:64:120 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i audio.mp3 -vcodec copy -acodec copy -y K:\introtolean\interviews\AA035101.MXF_000000034_crop.mp4
REM cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\ 
REM del audio.mp3 
REM del crop_audio.mp3 
REM del crop_video.mp4 

pause