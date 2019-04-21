import tensorflow
import time
import sys

with open ("results.txt", 'w') as f:
    for i in range(50):
        f.write(str(time.time()) + "\n")
        sys.stdout.flush()
        time.sleep(1)