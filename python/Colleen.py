#!/usr/bin/env python3

QUINE = "#!/usr/bin/env python3{0}{0}QUINE = {2}{3}{2}{0}{0}if __name__ == {2}__main__{2}:{0}{1}print(QUINE.format(chr(10), chr(9), chr(34), QUINE))"

if __name__ == "__main__":
    print(QUINE.format(chr(10), chr(9), chr(34), QUINE))
