import re
import os.path
path = '~/.cache/rofi-3.runcache'
path = os.path.expanduser(path)
f = open(path)
for s in f:
    l = re.findall('\d+\s+(.+)', s)
    cmd = l[0]
    # if cmd.startswith('.'):
    #    cmd = '~' + cmd[1:]
    print(cmd)
