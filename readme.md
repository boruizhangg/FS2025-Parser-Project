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
- **Stattius**

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
Install the ANTLR runtime for Python
```bash
pip install antlr4-python3-runtime
```







































