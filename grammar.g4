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
    |
    ;

expression
    : expression MULTIPLY expression
    | expression DIVIDE expression
    | expression PLUS expression            // addition
    | expression MINUS expression           // subtraction
    | STRING                                // "john" or 'pork'
    | BOOLEAN                               // True or False
    | NUMBER                                // number literal 67
    ;


//tokens

//assignment operators


//arithmetic operators
MULTIPLY    :'*';
DIVIDE      :'/';
PLUS : "+" ;
MINUS : "-" ;


//brackets and punctuation


//literals
BOOLEAN : 'True' | 'False' ;
STRING : '"' (~["\r\n])* '"'       // double-quoted strings
       | '\'' (~['\r\n])* '\''     // single-quoted strings
       ;
VAR     : [a-zA-Z_][a-zA-Z_0-9]* ;
NUMBER    : [0-9]+ ('.' [0-9]+)? ;


//whitespace
NEWLINE         : '\r'? '\n' ;
WS              : [ \t]+ -> skip ;

