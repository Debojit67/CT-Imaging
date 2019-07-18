function x=inbet(a,b,c)
x1=ceil(c);
x2=floor(c);
if(c==a || c==b)
    x=0;
else
    if(x1==a && x2==b)
        x=1;
    elseif(x1==b && x2==a)
        x=1;
    else
        x=0;
    end
end
       