# Python Parser (ANTLR4)
### *Principles of Programming Languages – Parser Project (Fall 2025)*  

---

## Project Overview

This project implements a **custom parser for a simplified subset of Python 3**, built using **ANTLR4**.  
The goal is to design a grammar (`python.g4`) that captures essential Python features, including:

- arithmetic expressions  
- assignment operations  
- conditionals (`if`, `elif`, `else`)  
- logical + comparison operations  
- `while` and `for` loops  
- nested block structures  
- comments (single-line + triple-quoted)  
- list literals  

The parser reads a `.py` file, tokenizes it using the lexer, parses it through the grammar, and produces a **parse tree** representing the structure of the program.  
This project demonstrates understanding of:

- context-free grammars  
- recursive descent parsing  
- language structure  
- ANTLR tool usage  
- indentation-sensitive syntax  

This is **not** a full Python parser — it only supports the features required for this project.

---

## Team Members

- **Hamza Farah**    
- **Borui Zhang** 
- **Gabe Edwards**  
- **Dhruv Bhakta**
- **Blade Hagman**

---

## Requirements (Environment & Setup)

To build, run, and test the parser in **VS Code**, you will need:

---

### **1. Python**
- **Python 3.10+**
  
---

### **2. Java (Required by ANTLR)**  
ANTLR is a Java program and requires Java to generate parser files.

Install:

- **Java JDK 17+**

Download Java from:  
https://adoptium.net/

---

### **3. Install Python ANTLR Runtime**  
Before generating all of the needed files, make sure you have downloaded the Python.g4 file and have placed it a folder that will contain all the ANTLR files
Install the ANTLR runtime for Python
```bash
pip install antlr4-python3-runtime
```

---

### **4. ANTLR Tool (antlr-4.13.1-complete.jar)**
Install the ANTLR runtime for Python:

https://www.antlr.org/download/antlr-4.13.1-complete.jar

---

### **5. Generate the Parser Files**
Open the terminal inside your ANTLR folder and run:
```bash
java -jar antlr-4.13.1-complete.jar -Dlanguage=Python3 python.g4 -o parser
```
This will create a new parser folder containing the generated Python files.
The imporant generted files are: 
- pythonLexer.py - This turns the input code into tokens
- pythonParser.py - This builds a parse tree

---

### **6. Running the Parser**
Before running the parser, you have to make sure that the test file is in the same same folder.
Oncethe parser files have been generated you can test any python file by running:
```bush
python main.py (test file name).py
```

































