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


//whitespace