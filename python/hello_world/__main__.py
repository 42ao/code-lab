import os
import subprocess
import sys

dir = os.path.dirname(__file__)
args = " ".join(sys.argv[1:])

print(f"Run via {__file__}")
subprocess.call(["python", f"{dir}/hello_world.py", args])
