function num=signi(num1)
if(num1> 0)
    if((num1-fix(num1))>0.99)
        num=fix(num1)+1;
    
    elseif((num1-fix(num1))<0.001)
        num=fix(num1);
    else
        num=num1;
    end

else
    if(abs((num1-fix(num1)))>0.99)
        num=fix(num1)-1;
    
    elseif(abs((num1-fix(num1)))<0.001)
        num=fix(num1);
    else
        num=num1;
    end
        
end
