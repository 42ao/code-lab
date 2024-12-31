#!/usr/bin/env python3

import os
import subprocess
from format.format import Section, Title, Code, Note, Source

python = "python3"
script_path = os.path.join(os.path.dirname(__file__), "hello_world_lib.py")

print(Source(script_path))
print(Code(f"working directory: {os.getcwd()}"))

print(Section("execute script via shebang interpreter"))
print(Code('./SCRIPT.py [ARGS]'))

print(Title("without arguments"))
print(Code(f'{script_path}'))
subprocess.run([script_path])

print(Title("with one argument"))
print(Code(f'{script_path} "yourself"'))
subprocess.run([script_path, "yourself"])

print(Title("with multiple arguments"))
print(Code(f'{script_path} first and last name'))
subprocess.run([script_path, "first", "and", "last", "name"])

print(Section("execute script via command line interpreter"))
print(Code(f"{python} ./SCRIPT.py [ARGS]"))

print(Title("without arguments"))
print(Code(f'{python} {script_path}'))
subprocess.run([python, script_path])

print(Title("with one argument"))
print(Code(f'{python} {script_path} "yourself"'))
subprocess.run([python, script_path, "yourself"])

print(Title("with multiple arguments"))
print(Code(f'{python} {script_path} first and last name'))
subprocess.run([python, script_path, "first", "and", "last", "name"])

print(Section("execute package via command line interpreter"))
print(Code(f"{python} ./PACKAGE [ARGS]"))

print(Note("This is not a python package"))

print(Title("without arguments"))
print(Code(f'{python} {os.path.dirname(script_path)}'))
subprocess.run([python, os.path.dirname(script_path)])

print(Title("with one argument"))
print(Code(f'{python} {os.path.dirname(script_path)} "yourself"'))
subprocess.run([python, os.path.dirname(script_path), "yourself"])

print(Title("with multiple arguments"))
print(Code(f'{python} {os.path.dirname(script_path)} first and last name'))
subprocess.run([python, os.path.dirname(script_path), "first", "and", "last", "name"])

print(Section("execute module via command line interpreter"))
print(Code(f"{python} -m MODULE [ARGS]"))

print(Note("Only works from within the module directory, or"))
print(Note("if the module is installed in the python path"))

print(Title("without arguments"))
print(Code(f'{python} -m hello_world_lib'))
subprocess.run([python, "-m", "hello_world_lib"])

print(Title("with one argument"))
print(Code(f'{python} -m hello_world_lib "yourself"'))
subprocess.run([python, "-m", "hello_world_lib", "yourself"])

print(Title("with multiple arguments"))
print(Code(f'{python} -m hello_world_lib first and last name'))
subprocess.run([python, "-m", "hello_world_lib", "first", "and", "last", "name"])

print(Section("execute imported function in python command string"))
print(Code(f'{python} -c "from MODULE import function; function([ARGS])"'))

print(Note("Only works from within the module directory, or"))
print(Note("if the module is installed in the python path"))

print(Title("without arguments"))
print(Code(f'{python} -c "from hello_world_lib import hello_world; hello_world([])"'))
subprocess.run([python, "-c", "from hello_world_lib import hello_world; hello_world([])"])

print(Title("with one argument"))
print(Code(f'{python} -c "from hello_world_lib import hello_world; hello_world(greetings=[\'yourself\'])"'))
subprocess.run([python, "-c", "from hello_world_lib import hello_world; hello_world(greetings=['yourself'])"])

print(Title("with multiple arguments"))
print(Code(f'{python} -c "from hello_world_lib import hello_world; hello_world(greetings=[\'first\', \'and\', \'last\', \'name\'])"'))
subprocess.run([python, "-c", "from hello_world_lib import hello_world; hello_world(greetings=['first', 'and', 'last', 'name'])"])
