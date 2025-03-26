from orgparse import load, loads

import os
from pathlib import Path
from shutil import copyfile

orgDir = Path("C:/Users/scott/OneDrive - Clean Power Research/ref/DOE_brainstorm/old")

orgInBaseNm = 'abdel_nasser19pvpowfrcst_lstm_rnn.org'

orgInFNm = orgDir / orgInBaseNm

orgRoot = load(str(orgInFNm))

i = 0
for node in orgRoot: #orgRoot.children:
    print(f"{i}: {node}")
 #   break
    #print(node.get_property("TITLE"))
    i += 1

# ;load(file_like_object)

# ;loads('''
# ;* This is org-mode contents
# ;  You can load org object from string.
# ;** Second header
# ;''')
