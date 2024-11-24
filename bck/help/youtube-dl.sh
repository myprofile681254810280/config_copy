
1. Download classic flv type and save it as file.flv

youtube-dl -o file.flv "http://www.youtube.com/watch?v=Y54ABqSOScQ"

2. Download Full HD mp4 file and save it as file.mp4

youtube-dl -o file.mp4 -f 37 "http://www.youtube.com/watch?v=Y54ABqSOScQ"


youtube-dl  "http://www.youtube.com/watch?v=Y54ABqSOScQ" --list-extractors              
youtube-dl   --list-extractors   "https://www.youtube.com/watch?v=RNVxmThy3nM"
youtube-dl   --list-formats "https://www.youtube.com/watch?v=RNVxmThy3nM" | grep best
youtube-dl   -f 22 "https://www.youtube.com/watch?v=RNVxmThy3nM" 


youtube-dl   --list-formats "https://www.bilibili.com/video/av9381833" #| grep best
youtube-dl   --list-formats "https://v.youku.com/v_show/id_XMjY5NjYxNjk0MA" #| grep best

