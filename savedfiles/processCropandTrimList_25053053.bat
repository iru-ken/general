cd C:\Users\KHUBBELL\SkyDrive\projects\Toolkit\IRU.Video.Prep.Tool\

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA036501.MXF -ss 00:00:02.25 -t 00:00:15.13 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:364:256, scale=720:480" -y E:\introtolean\interviews\AA036501.MXF_000000085_crop.mp4

pause
