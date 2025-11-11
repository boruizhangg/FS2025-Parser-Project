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
    : PLUS_ASSIGN     : '+=' ;
    | MINUS_ASSIGN    : '-=' ;
    ;

expression
    : expression MULTIPLY expression
    | expression DIVIDE expression
    | expression PLUS expression            // addition
    | expression MINUS expression           // subtraction
    | STRING                                // "john" or 'pork'
    | BOOLEAN                               // True or False
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
ID     : [a-zA-Z_][a-zA-Z_0-9]* ;


//whitespace
NEWLINE         : '\r'? '\n' ;
WS              : [ \t]+ -> skip ;

