function [xoo,yoo]=pix(xg,yg,flag,interval)
xref1=-128;yref1=128;xdef=1;ydef=1;shift1=0;
if(xg<0)
    yoo=xdef+xg-xref1+shift1;
end
if(yg<0)
        xoo=ydef-yg+yref1+shift1;
end
if(xg>0)
    yoo=xdef+xg-xref1+shift1;
end
if(yg>0)
    xoo=ydef-yg+yref1+shift1;
end
if(yg==0)
    xoo=ydef+yref1+shift1;
end

if(xg==0)
    yoo=xdef-xref1+shift1;
end

        if(flag=='y')
            if(interval==1)
            xoo=xoo+1;
            end
        elseif(flag=='x')
            if(interval==-1)
            yoo=yoo-1;
            end
        end
end

