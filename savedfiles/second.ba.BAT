cd E:\IRU.Video.Prep.Tool\
ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 6 -frames:v 847 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 6 -i E:\introtolean\interviews\AA035101.MXF -frames:v 847 -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:152:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000006_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 34 -frames:v 663 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 34 -i E:\introtolean\interviews\AA035101.MXF -frames:v 663 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:0:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000034_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 56 -frames:v 123 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 56 -i E:\introtolean\interviews\AA035101.MXF -frames:v 123 -vcodec libx264 -b:v 2000k -filter:v "crop=1440:960:252:60 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000056_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 60 -frames:v 945 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 60 -i E:\introtolean\interviews\AA035101.MXF -frames:v 945 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:788:172 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000060_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 92 -frames:v 393 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 92 -i E:\introtolean\interviews\AA035101.MXF -frames:v 393 -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:132:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000092_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 105 -frames:v 773 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 105 -i E:\introtolean\interviews\AA035101.MXF -frames:v 773 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:788:140 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000105_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 130 -frames:v 515 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 130 -i E:\introtolean\interviews\AA035101.MXF -frames:v 515 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:72:140 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000130_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 148 -frames:v 466 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 148 -i E:\introtolean\interviews\AA035101.MXF -frames:v 466 -vcodec libx264 -b:v 2000k -filter:v "crop=1080:720:788:136 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000148_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4 

ffmpeg64\bin\ffmpeg -i E:\introtolean\interviews\AA035101.MXF audio.mp3
ffmpeg64\bin\ffmpeg -ss 163 -frames:v 454 -i audio.mp3 -acodec copy crop_audio.mp3
ffmpeg64\bin\ffmpeg -ss 163 -i E:\introtolean\interviews\AA035101.MXF -frames:v 454 -vcodec libx264 -b:v 2000k -filter:v "crop=1620:1080:160:0 ,scale=720:480" -y crop_video.mp4
ffmpeg64\bin\ffmpeg -i crop_audio.mp3 -i crop_video.mp4 -acodec copy -vcodec copy -y E:\introtolean\interviews\AA035101.MXF_000000163_crop.mp4
cd E:\IRU.Video.Prep.Tool\ 
del audio.mp3 
del crop_audio.mp3 
del crop_video.mp4