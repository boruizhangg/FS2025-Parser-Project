grammar python;

// Parser Rules
program
    : statement+ EOF
    ;

statement
    : assignment
    | if_statement  //To allow for the if/elif statement
    | while_statement  //To allow for while loops
    | for_statement //allows for loops
    | NEWLINE
    ;

assignment
    : VAR ASSIGNMENT expression NEWLINE?     // x = 67
    | VAR PLUS_ASSIGN expression NEWLINE?    // plus assign: x += 5
    | VAR MINUS_ASSIGN expression NEWLINE?   // minus assign: x -= 5
    | VAR MULT_ASSIGN expression NEWLINE?    // x *= 5
    | VAR DIV_ASSIGN expression NEWLINE?     // x /= 5
    ;

expression
    : NOT expression                        // logical not 
    | MINUS expression   
    | expression MULTIPLY expression
    | expression DIVIDE expression
    | expression MODULO expression          // modulo
    | expression PLUS expression            // addition
    | expression MINUS expression           // subtraction
    | expression LT expression              // less than < 
    | expression LTE expression             // less than or equal <= 
    | expression GT expression              // greater than > 
    | expression GTE expression             // greater than or equal >= 
    | expression EQ expression              // equality == 
    | expression NEQ expression             // not equal != 
    | expression AND expression             // logic and
    | expression OR expression              // logic or
    | LPAREN expression RPAREN              // parentheses 
    | STRING                                // "john" or 'pork'
    | BOOLEAN                               // True or False
    | NUMBER                                // number literal 67
    | VAR 
    | list
    ;

list
    : LBRACKET RBRACKET                                    // empty list []
    | LBRACKET expression (COMMA expression)* RBRACKET     // [6, 7, 67]
    ;

// reusable block/suite for nested statements
block
    : NEWLINE NEWLINE? statement+
    ;

// if/elif/else
if_statement
    : IF expression COLON block
      (ELIF expression COLON block)*
      (ELSE COLON block)?
    ;

// while loop
while_statement
    : WHILE expression COLON block
    ;

// SPECIALIZED range(...) handling for for-loops
range_call
    : RANGE LPAREN (expression (COMMA expression)*)? RPAREN
    ;

// for loop
for_statement
    // "for i in range...
    : FOR VAR IN range_call COLON block 
    // for data in array1 ...
    | FOR VAR IN expression COLON block
    ;

//while loop
while_statement
    : WHILE expression COLON NEWLINE
      NEWLINE? statement+
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

//if/elif/else
IF      : 'if' ;
IN      : 'in' ;
ELIF    : 'elif' ;
ELSE    : 'else' ;
COLON   : ':' ;

//while loop
WHILE   : 'while' ;

//for loop
FOR     : 'for' ;

special token for 'range' so we can spot " for i in range(...)" blah blah
RANGE   : 'range' ;

//brackets and punctuation
LPAREN          : '(' ;
RPAREN          : ')' ;
LBRACKET        : '[' ;
RBRACKET        : ']' ;
COMMA           : ',' ;


//literals
BOOLEAN : 'True' | 'False' ;

// single-line comments: # ... or ## ...
COMMENT
    : '#' ~[\r\n]* -> skip
    ;

// triple-quoted "block comments": ''' john pork ''' or """ 67 """
BLOCK_COMMENT
    : ( '\'\'\'' ( . | '\r' | '\n' )*? '\'\'\''
      | '"""'   ( . | '\r' | '\n' )*? '"""'
      ) -> skip
    ;

STRING : '"' (~["\r\n])* '"'       // double-quoted strings
       | '\'' (~['\r\n])* '\''     // single-quoted strings
       ;

// identifiers / numbers
VAR     : [a-zA-Z_][a-zA-Z_0-9]* ;
NUMBER  : [0-9]+ ('.' [0-9]+)? ;


//whitespace
NEWLINE         : '\r'? '\n' ;
WS              : [ \t]+ -> skip ;
