function x=lineseqn(x1,x2,y1,y2)
% enter 1 for normal lines
% enter 2 for lines parallel to y axis
% enter 3 for lines parallel to x axis
if(x1~=x2 && y1~=y2)
    m=(y2-y1)/(x2-x1);
    x(2)=1;
    x(1)=-1*m;
    x(3)=y1-m*x1;
elseif(y1~=y2 && x1==x2)
    x(2)=0;
    x(1)=1;
    x(3)=x1;
elseif(x1~=x2 && y1==y2)
    x(2)=1;
    x(1)=0;
    x(3)=y1;
else
    flag=1;
end
