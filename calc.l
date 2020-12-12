%{
    #include <stdio.h>
    #include <string.h>

    void yyerror(char *c);
    #include "y.tab.h"
%}

%%
[0-9]+ {
    yylval = atoi(yytext);
    return INT;
    }
[+] {return SOMA;}
\n  {return EOL;}
. ;

%%
int yywrap(){
    return 1;
}