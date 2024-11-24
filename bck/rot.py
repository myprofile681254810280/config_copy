import os
import re
import subprocess
import sys

ORIENTATIONS = 'normal', 'left', 'right', 'inverted'
if len(sys.argv) > 1:
    target = sys.argv[1]
    assert target in ORIENTATIONS
else:
    target = None

cmd = "xrandr --query --verbose"
s = subprocess.check_output(cmd, shell=True).decode()
for line in s.split('\n'):
    if 'disconnected' not in line:
        if 'connected' in line:
            if target is None:
                r = '\) (.+) \('
                orientation = re.findall(r, line)[0]
            else:
                r = '^\S+'
                output = re.findall(r, line)[0]
                cmd = 'xrandr --output "%s" --rotate %s' % (output, target)
                os.system(cmd)
                # 下面这种会改掉dpi
                # xrandr -o $orientation
if target is None:
    print(orientation)
else:
    print(target)
