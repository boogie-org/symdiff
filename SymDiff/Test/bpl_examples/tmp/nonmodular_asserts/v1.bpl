var a:int;

procedure A()
modifies a;
ensures a > 0;
{
    a := a + 1;
    call B();
}

procedure B()
modifies a;
ensures a > 1;
{
    a := a + 1;
}

