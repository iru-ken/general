cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\
ffmpeg64\bin\ffmpeg -i K:\introtolean\interviews\AA036501.MXF -y audio.mp3
ffmpeg64\bin\ffmpeg -ss 3 -i audio.mp3 -t 15 -acodec copy -y crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 3 -i K:\introtolean\interviews\AA036501.MXF -frames:v 463 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:364:256 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i crop_audio.mp3 -vcodec copy -acodec copy -y K:\introtolean\interviews\AA036501.MXF_000000003_crop.mp4
REM cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\ 
REM del audio.mp3 
REM del crop_audio.mp3 
REM del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i K:\introtolean\interviews\AA036501.MXF -y audio.mp3
ffmpeg64\bin\ffmpeg -ss 18 -i audio.mp3 -t 19 -acodec copy -y crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 18 -i K:\introtolean\interviews\AA036501.MXF -frames:v 574 -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:144:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i crop_audio.mp3 -vcodec copy -acodec copy -y K:\introtolean\interviews\AA036501.MXF_000000018_crop.mp4
REM cd C:\Users\khubbell\Desktop\IRU.Video.Prep.Tool\ 
REM del audio.mp3 
REM del crop_audio.mp3 
REM del crop_video.mp4