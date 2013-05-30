cd C:\Users\KHUBBELL\SkyDrive\projects\Toolkit\IRU.Video.Prep.Tool\
ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA036501.MXF -ss  00:00:02.25  -t  00:00:15.13  -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:364:256 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i audio.mp3 -vcodec copy -acodec copy -y E:\introtolean\interviews\AA036501.MXF_000000085_crop.mp4
cd C:\Users\KHUBBELL\SkyDrive\projects\Toolkit\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA036501.MXF -ss  00:00:18.08  -t  00:00:19.04  -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:144:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i audio.mp3 -vcodec copy -acodec copy -y E:\introtolean\interviews\AA036501.MXF_000000548_crop.mp4
cd C:\Users\KHUBBELL\SkyDrive\projects\Toolkit\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_video.mp4