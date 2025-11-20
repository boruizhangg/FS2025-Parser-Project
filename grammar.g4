    grammar python;

// Parser Rules
program
    : statement+ EOF
    ;

statement
    : assignment
    | expression NEWLINE
    | if_statement  //To allow for the if/elif statement
    | NEWLINE
    ;

assignment
    : VAR ASSIGNMENT expression NEWLINE     // x = 67
    | VAR PLUS_ASSIGN expression NEWLINE    // plus assign: x += 5
    | VAR MINUS_ASSIGN expression NEWLINE   // minus assign: x -= 5
    | VAR MULT_ASSIGN expression NEWLINE     // x *= 5
    | VAR DIV_ASSIGN expression NEWLINE      // x /= 5
    ;

expression
    : expression MULTIPLY expression
    : NOT expression                        //logical not
    | expression DIVIDE expression
    | expression PLUS expression            // addition
    | expression MINUS expression           // subtraction
    | expression AND expression             // logic and
    | expression OR expression              // logic or
    | expression EQ expression              // equality == 
    | expression NEQ expression             // not equal != 
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

//if/elif statement stuff
if_statement
    : IF expression COLON NEWLINE
      NEWLINE? statement
      (ELIF expression COLON NEWLINE
       NEWLINE? statement)*
      (ELSE COLON NEWLINE
       NEWLINE? statement+)?
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
PLUS : '+' ;
MINUS : '-' ;
MODULO  : '%' ;

// comparison operators
LTE : '<=' ;
GTE : '>=' ;
LT : '<' ;
GT : '>' ;
EQ  : '==' ;   
NEQ : '!=' ;   

//logical operators
AND     : 'and' ;
OR      : 'or' ;
NOT     : 'not' ;

//if/elif/;
IF      : 'if' ;
ELIF    : 'elif' ;
ELSE    : 'else' ;
COLON   : ':' ;


//brackets and punctuation
LPAREN          : '(' ;
RPAREN          : ')' ;
LBRACKET        : '[' ;
RBRACKET        : ']' ;
COMMA           : ',' ;


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


