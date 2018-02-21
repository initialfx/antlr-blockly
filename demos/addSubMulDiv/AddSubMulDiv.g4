grammar AddSubMulDiv;

prog:   stat+ ; 

stat:   printExpr
    |   assign
    |   blank
    ;

printExpr : expression NEWLINE ;
assign : ID '=' expression NEWLINE ;
blank : NEWLINE ;

statExprSplit : '=== statement ^ === expression v ===' ;

expression
    :   expression MulDivAddSub_List expression
//    |   parens
    |   intExpr
    |   idExpr
    ;

//parens : '(' expr ')' ;
intExpr : INT ;
idExpr : ID ;

MulDivAddSub_List : '*'|'/'|'+'|'-' ;

ID  :   [a-zA-Z_][a-zA-Z_0-9]+ ; // match identifiers
INT :   [0-9]+ ;                 // match integers

MeaningfulSplit : '=== meaningful ^ ===' ;

NEWLINE:'\r'? '\n' ;             // return newlines to parser (is end-statement signal)
WS  :   [ \t]+ -> skip ;         // toss out whitespace