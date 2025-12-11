import sys
from antlr4 import FileStream, CommonTokenStream

from parser.pythonLexer import pythonLexer
from parser.pythonParser import pythonParser

def main():
    if len(sys.argv) < 2:
        print("Usage: python main.py <input_file.py>")
        sys.exit(1)

    input_file = sys.argv[1]

    #Load the file
    stream = FileStream(input_file, encoding='utf-8')

    #Lexer
    lexer = pythonLexer(stream)
    tokens = CommonTokenStream(lexer)

    #Parser
    parser = pythonParser(tokens)
    tree = parser.program()

    #Print the parse tree
    print(tree.toStringTree(recog=parser))

if __name__ == "__main__":
    main()
