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
    ;


//tokens

//assignment operators


//arithmetic operators
MULTIPLY    :'*';
DIVIDE      :'/';

//brackets and punctuation


//literals
ID              : [a-zA-Z_][a-zA-Z_0-9]* ;


//whitespace
// Whitespace
NEWLINE         : '\r'? '\n' ;
WS              : [ \t]+ -> skip ;
