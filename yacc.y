%{
       #include<stdio.h>
       #include<math.h>
       
        void yyerror(char *);
    	int yylex(void);
%}

%union				//Definir a possibilidade dos tipos de simbolos
{ double p;}
%token<p>num

 %left '+''-'			//Menor precedência
%left '*''/'			//Maior precedência

%type<p>expressao			//Seta o tipo de não terminal
%%

/* printar a resposta */
ss: expressao {printf("Resposta =%g\n",$1);}


expressao :expressao'+'expressao      { $$=$1+$3; }
       |expressao'-'expressao      { $$=$1-$3; }
       |expressao'*'expressao      { $$=$1*$3; }
       |expressao'/'expressao      { $$=$1/$3; }
       |'-'expressao         {$$=-$2;}
       |num;
 	|'('expressao')'      {$$=$2;}
 	|'['expressao']'      {$$=$2;}
 	
%%

int main()
{
       do
       {
       		yyparse();	
       }while(1);

}

void yyerror(s)			

char *s;
{
       printf("ERRO");
}

