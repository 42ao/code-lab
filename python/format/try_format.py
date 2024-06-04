#!../../.venv/bin/python

import os
from format.format import padded, Source, Section, Title, Code, Note, BOF, EOF

print(Source("format.py"))

print(Title("Set title color env var"))
print(Code('os.environ["COLOR_TITLE"] = "BRIGHT_RED"'))
os.environ["COLOR_TITLE"] = "BRIGHT_RED"

print(Title("Padded with default padding character"))
print(Code('print(padded("This string is padded until 80 characters"))'))
print(padded("This string is padded until 80 characters"))

print(Title("Padded with #"))
print(Code('print(padded("This string is padded until 80 characters with #", "#"))'))
print(padded("This string is padded until 80 characters with #", "#"))

print(Title("Section"))
print(Code('print(Section("section"))'))
print(Section("section"))

print()
print(Code('print(Title("This is a title"))'))
print(Title("This is a title"))

print(Title("Single line code"))
print(Code('print(Code("Single line code"))'))

print(Title("Multi-line code"))
print(
    Code('''print(Code("""print("Some")
print("multiline"
print("code")""")''')
)
print("Some")
print("multiline")
print("code")

print(Title("Note"))
print(Code('print(Note("This is a note"))'))
print(Note("This is a note"))

print(Title("Beginning of file"))
print(Code('print(BOF("format.py"))'))
print(BOF("format.py"))

print(Title("End of file"))
print(Code('print(EOF("format.py"))'))
print(EOF("format.py"))
