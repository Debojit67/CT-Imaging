function [x,y]=detarrcord(dist,arrlen,theta)
% arrlen=arrlen+1;
xcentre=dist*cosd(theta);
ycentre=dist*sind(theta);
p=1;
for i=0:1:arrlen,
    if(theta >=0 && theta<90)
    if(i> arrlen/2)
        x(i+1)=-1*(xcentre-p*sind(theta));
        y(i+1)=-1*(ycentre+p*cosd(theta));
        p=p+1;
    elseif(i==arrlen/2)
        x(i+1)=-1*xcentre;
        y(i+1)=-1*ycentre;
    else
        fi=arrlen/2;
        x(i+1)=-1*(xcentre+(fi-i)*sind(theta));
        y(i+1)=-1*(ycentre-(fi-i)*cosd(theta));
    end
    elseif(theta>90 && theta<180)
         if(i> arrlen/2)
        x(i+1)=-1*(xcentre-p*sind(theta));
        y(i+1)=-1*(ycentre+p*cosd(theta));
        p=p+1;
    elseif(i==arrlen/2)
        x(i+1)=-1*xcentre;
        y(i+1)=-1*ycentre;
    else
        fi=arrlen/2;
        x(i+1)=-1*(xcentre+(fi-i)*sind(theta));
        y(i+1)=-1*(ycentre-(fi-i)*cosd(theta));
         end
    elseif(theta >= 180 && theta < 270)
         if(i> arrlen/2)
        x(i+1)=-1*(xcentre-p*sind(theta));
        y(i+1)=-1*(ycentre+p*cosd(theta));
        p=p+1;
    elseif(i==arrlen/2)
        x(i+1)=-1*xcentre;
        y(i+1)=-1*ycentre;
    else
        fi=arrlen/2;
        x(i+1)=-1*(xcentre+(fi-i)*sind(theta));
        y(i+1)=-1*(ycentre-(fi-i)*cosd(theta));
         end
    else
         if(i> arrlen/2)
        x(i+1)=-1*(xcentre-p*sind(theta));
        y(i+1)=-1*(ycentre+p*cosd(theta));
        p=p+1;
    elseif(i==arrlen/2)
        x(i+1)=-1*xcentre;
        y(i+1)=-1*ycentre;
    else
        fi=arrlen/2;
        x(i+1)=-1*(xcentre+(fi-i)*sind(theta));
        y(i+1)=-1*(ycentre-(fi-i)*cosd(theta));
         end
    end
end 
        