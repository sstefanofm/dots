#! /usr/bin/env python

import subprocess

def main():
    geom = subprocess.check_output(["/usr/bin/slurp"], text=True).strip()

    if not geom:
        return 1

    grim = subprocess.Popen(
        ["/usr/bin/grim", "-g", geom, "-"],
        stdout=subprocess.PIPE
    )

    subprocess.run(
        ["/usr/bin/wl-copy"],
        stdin=grim.stdout
    )

    grim.stdout.close()
    grim.wait()

    return 0

if __name__ == "__main__":
    raise(SystemExit(main()))
