    grammar python;

// Parser Rules
program
    : statement+ EOF
    ;

statement
    : assignment
    | expression NEWLINE
    | NEWLINE
    ;

assignment
    :
    ;

expression
    :
    | expression PLUS expression            // addition
    | expression MINUS expression           // subtraction
    | STRING                                // "john" or 'pork'
    | BOOLEAN                               // True or False
    ;


//tokens

//assignment operators


//arithmetic operators
PLUS : "+" ;
MINUS : "-" ;


//brackets and punctuation


//literals
BOOLEAN : 'True' | 'False' ;
STRING : '"' (~["\r\n])* '"'       // double-quoted strings
       | '\'' (~['\r\n])* '\''     // single-quoted strings
       ;


//whitespace