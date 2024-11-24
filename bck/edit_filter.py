#!/usr/bin/python
"""
因为太熟悉用vim编辑文件了,所以没法记得在打开org文件的时候,换成emacs
不过要巧妙的传递参数似乎是件挺麻烦的事
或许存在可以直传参数的第三方库.

仅仅只过滤arg[0]参数
"""
import sys
import subprocess
commands = sys.argv[1:]
emacs = False
for c in commands:
    if c.strip().endswith('.org'):
        emacs = True

if emacs:
    print('vim ' + ' '.join(commands))
else:
    subprocess.call(['vim'] + commands)
