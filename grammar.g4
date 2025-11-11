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
    ;


//tokens

//assignment operators


//arithmetic operators


//brackets and punctuation


//literals


//whitespace