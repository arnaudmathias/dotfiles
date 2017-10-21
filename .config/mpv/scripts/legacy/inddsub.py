import os
import sys
from babelfish import *
from subliminal import *

def getfilename(path):
    basename = os.path.splitext(os.path.basename(path))[0]
    filename = basename + ".en.srt"
    return filename

def getnewfilename(path):
    basename = os.path.splitext(os.path.basename(path))[0]
    filename = basename + ".en.srt"
    pathtrim = os.path.dirname(path) + "\\"
    if os.path.isfile(pathtrim + filename):
        index = 0
        while os.path.isfile(pathtrim + filename):
            index += 1
            filename = basename + ".en." + str(index) + ".srt"
    return pathtrim + filename

getnewfilename(sys.argv[1]);
video = scan_video(sys.argv[1])
my_region = region.configure('dogpile.cache.memory')
sub = download_best_subtitles([video], {Language('eng')}, providers=['opensubtitles'])
if sub[video] is None:
    sub = download_best_subtitles([video], {Language('en')}, providers=['addic7ed'])
tmpsub = os.path.normpath(os.getenv('APPDATA') + "/mpv/tmpsub/")
if not os.path.exists(tmpsub):
    os.makedirs(tmpsub)
save_subtitles(video, sub[video], False, tmpsub)
os.rename(tmpsub + "\\" + getfilename(sys.argv[1]), getnewfilename(sys.argv[1]))
