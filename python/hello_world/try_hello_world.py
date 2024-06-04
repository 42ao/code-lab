#!../.venv/bin/python

import subprocess

from format.format import Code, Note, Section, Source, Title

print(Source("./hello_world.py"))

python = "../.venv/bin/python"
print(Title(f"Use python = {python}"))

print(Section("execute script via shebang interpreter from subprocess call"))
print(Code('subprocess.call(["./SCRIPT.py", "ARGS"])'))

print(Title("without arguments"))
print(Code('subprocess.call(["./hello_world.py"])'))
subprocess.call(["./hello_world.py"])

print(Title("with one argument"))
print(Code('subprocess.call(["./hello_world.py", "yourself"])'))
subprocess.call(["./hello_world.py", "yourself"])

print(Title("with multiple arguments"))
print(Code('subprocess.call(["./hello_world.py", "first", "and", "last", "name"])'))
subprocess.call(["./hello_world.py", "first", "and", "last", "name"])

print(Section("execute script via command line interpreter from subprocess call"))
print(Code(f'subprocess.call([{python}, "./SCRIPT.py", "ARGS"])'))	

print(Title("without arguments"))
print(Code(f'subprocess.call([{python}, "./hello_world.py"])'))
subprocess.call([python, "./hello_world.py"])

print(Title("with one argument"))
print(Code(f'subprocess.call([{python}, "./hello_world.py", "yourself"])'))
subprocess.call([python, "./hello_world.py", "yourself"])

print(Title("with multiple arguments"))
print(Code(f'subprocess.call([{python}, "./hello_world.py", "first", "and", "last", "name"])'))
subprocess.call([python, "./hello_world.py", "first", "and", "last", "name"])

print(Section("execute module via command line interpreter from subprocess call"))
print(Code(f'subprocess.call([{python}, "-m", "MODULE" "[ARGS]"'))

print(Note("Only works from within the module directory"))

print(Title("without arguments"))
print(Code(f'subprocess.call([{python}, "-m", "hello_world"])'))
subprocess.call([python, "-m", "hello_world"])

print(Title("with one argument"))
print(Code(f'subprocess.call([{python}, "-m", "hello_world", "yourself"])'))
subprocess.call([python, "-m", "hello_world", "yourself"])

print(Title("with multiple arguments"))
print(Code(f'subprocess.call([{python}, "-m", "hello_world", "first", "and", "last name"])'))
subprocess.call([python, "-m", "hello_world", "first", "and", "last name"])

print(Section("execute imported module in python command string"))
print(Code(f'subprocess.call([{python} -c \"import MODULE\""))'))
print(Code(f'subprocess.call([{python}, "-c", "import hello_world"])'))

print(Title("without arguments"))
print(Code(f'subprocess.call([{python}, "-c", "import hello_world"])'))
subprocess.call([python, "-c", "import hello_world"])
print(Note("Only works from within the module directory"))
print(Note("No arguments can be passed"))

# TODO excecute script via dynamically excuting string via exec

# TODO direct import
