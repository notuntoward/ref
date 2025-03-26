from orgparse import load, loads
import pathlib as pl

root = load(str(pl.Path(r'..\howto.org').absolute()))

""" for node in root[1:]:  # [1:] for skipping root itself
for node in root:  # [1:] for skipping root itself
     print(node)
 """
for c in root.children:
    print(c)
    for c2 in c.children:
        print(" ", c2)
