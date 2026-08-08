import sys
import sympy
from TypstConverter import TypstMathConverter


if __name__ == '__main__':
    convertor = TypstMathConverter()
    # Get the decorators to register functions
    operator, relation_op, additive_op, mp_op, postfix_op, reduce_op, func, func_mat, constant = convertor.get_decorators()

    # 1. Explicitly define the 'mat' function for the parser
    # The decorator handles registering it in id2type and id2func
    @func_mat(name="mat")
    def convert_mat(mat_data):
        return sympy.matrices.Matrix(mat_data)

    # 2. (Optional) Define variables you expect to use
    convertor.define_symbol_base('x')
    
    # Now it will work
    input_text = sys.stdin.read().strip()
    expr = convertor.sympy(input_text)
    print(convertor.typst(sympy.simplify(expr)))

