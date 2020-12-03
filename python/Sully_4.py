#!/usr/bin/env python3

import os

I = 4 - 1

FILENAME = "Sully_" + str(I) + ".py"

QUINE = "#!/usr/bin/env python3{0}{0}import os{0}{0}I = {3} - 1{0}{0}FILENAME = {2}Sully_{2} + str(I) + {2}.py{2}{0}{0}QUINE = {2}{4}{2}{0}{0}if __name__ == {2}__main__{2}:{0}{1}if I >= 0:{0}{1}{1}with open(FILENAME, 'w') as f:{0}{1}{1}{1}f.write(QUINE.format(chr(10), chr(9), chr(34), I, QUINE)){0}{1}{1}{1}os.system({2}chmod 777 {2} + FILENAME + {2};./{2} + FILENAME)"

if __name__ == "__main__":
	if I >= 0:
		with open(FILENAME, 'w') as f:
			f.write(QUINE.format(chr(10), chr(9), chr(34), I, QUINE))
			os.system("chmod 777 " + FILENAME + ";./" + FILENAME)