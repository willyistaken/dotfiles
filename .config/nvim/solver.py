import sys
from re import findall, split, MULTILINE
import sympy
from sympy import solve as solving, latex
from latex2sympy2 import latex2sympy, latex2latex
import latex2sympy2


def solve(latex_text):
    if(len(latex_text)>5 and latex_text[0:3]=="num"):
        latex_text = latex_text[4:-1]
        if("=" in latex_text):
            lhs= latex_text.split("=")[0]
            rhs= latex_text.split("=")[1]
            guess = 0
            if("," in rhs):
                guess = float(rhs.split(',')[1])
                rhs = rhs.split(',')[0]
            f = latex2sympy(lhs+"-("+rhs+")")
            print(sympy.nsolve(f,guess))
        else:
            latex_text = latex2sympy(latex_text);
            print(latex_text.evalf())
        return
    print(latex2latex(latex_text))
    return

if __name__ == "__main__":
    input_text = sys.stdin.read()  # Read from stdin
    solve(input_text)
