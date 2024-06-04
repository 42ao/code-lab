#!../.venv/bin/python

# Parent package needs to be installed first
from format.format import Title, Note

print(Title("Load hello_world module"))
import hello_world  # noqa: E402

print(Title("Show help of hello_world module"))
help(hello_world)

print(Note("This still executes the script itself"))
