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
    : VAR ASSIGNMENT expression NEWLINE     // x = 67
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
    | expression MODULO expression           // modulo
    | VAR 
    | list
    ;

list
    : LBRACKET RBRACKET                                    // empty list []
    | LBRACKET expression (COMMA expression)* RBRACKET     // [6, 7, 67]
    ;


//tokens

//assignment operators
ASSIGNMENT  : '=' ;
PLUS_ASSIGN : '+=' ;
MINUS_ASSIGN : '-=' ;
MULT_ASSIGN : '*=' ;
DIV_ASSIGN : '/=' ;

//arithmetic operators
MULTIPLY    :'*';
DIVIDE      :'/';
PLUS : "+" ;
MINUS : "-" ;
MODULO  : '%' ;

// comparison operators
LTE : '<=' ;
GTE : '>=' ;
LT : '<' ;
GT : '>' ;

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

