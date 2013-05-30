cd C:\Users\KHUBBELL\SkyDrive\projects\Toolkit\IRU.Video.Prep.Tool\

ffmpeg64\bin\ffmpeg -ss 00:00:02.250 -i E:\introtolean\interviews\AA036501.MXF -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:364:256, scale=720:480" -t 00:01:17.250 -y audio_video.mp4

REM ffmpeg -i input.mp4 -c:v copy -c:a copy


pause