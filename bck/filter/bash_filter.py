#!/usr/bin/python
"""
经常性误用bash运行python.过滤下不要运行py后缀文件.
仅仅只过滤arg[0]参数

2017-05-05 14:47:48 Fri JST
不能用subprocess,因为会保留下python进程,
所以换用pipe| python进程处理完后缀后就会结束,
ctrl+c的时候,会是明确终结实际进程而不是python进程
"""
import sys
#import subprocess
commands = sys.argv[1:]
python = False
if len(commands) > 0 and commands[0].strip().endswith('.py'):
    python = True

if python:
    print('echo bash ' + ' '.join(commands))
else:
    print('bash ' + ' '.join(commands))
    #subprocess.call(['bash'] + commands)
