typedef struct _EXPR{
  int oper;
  int op1, op2;
  int result;
} EXPR, *PEXPR;

void Eval(PEXPR e)
{

  if (e->oper == 1)
  {
    e->result = e->op1 + e->op2;
  }
  else if (e->oper == 2) 
  { 
     e->result = e->op1 - e->op2; 
  } 
  else
  {
    e->result = -1;
  }
}


