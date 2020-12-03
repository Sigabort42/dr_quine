#!/usr/bin/env python3
#Commentaire

FILENAME = "Grace_kid.py"

QUINE = "#!/usr/bin/env python3{0}#Commentaire{0}{0}FILENAME = {2}Grace_kid.py{2}{0}{0}QUINE = {2}{3}{2}{0}{0}{0}with open(FILENAME, 'w') as f:{0}{1}f.write(QUINE.format(chr(10), chr(9), chr(34), QUINE))"

with open(FILENAME, 'w') as f:
    f.write(QUINE.format(chr(10), chr(9), chr(34), QUINE))
