function x=bet(a,b)
a=fix(a);
b=fix(b);
if(abs(a)>abs(b))
    x=a;
else
    x=b;
end