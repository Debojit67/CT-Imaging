tic
g=zeros(256,256);
g(19:238,19:238)=20;
xc=128;yc=128;
for r=1:1:100;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=40;
end
end
xc=128;yc=128;
for r=1:1:80;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=80;
end
end
xc=110;yc=95;
for r=1:1:25;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=255;
end
end
xc=110;yc=165;
for r=1:1:25;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=255;
end
end
xc=110;yc=165;
for r=1:1:5;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=20;
end
end
xc=160;yc=128;
for r=1:1:8;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=200;
end
end
xc=110;yc=165;
for r=1:1:5;
for ang=0:0.001:2*pi;
    x=fix(r*cos(ang));
    y=fix(r*sin(ang));
    g(x+xc,y+yc)=150;
end
end
zz=uint8(g);
dist=512;ite=0;
arrlen=512;a=[];z=1;
b=java.util.LinkedList;
li=b.listIterator;
bx=java.util.LinkedList;
lix=bx.listIterator;
by=java.util.LinkedList;
liy=by.listIterator;
xoo=0;yoo=0;
tth=[0 61 93 123 179];
kkh=size(tth);
       for thet=1:1:kkh(2),
           theta=tth(thet);
%                                             theta=80;
ite=ite+1;
   [x,y]=detarrcord(dist,arrlen,theta);
              for j=1:1:arrlen,
% for j=1:1:,
%                                j=474;
                
                    array=[];
       Aeqn1=lineseqn(dist*cosd(theta),x(j),dist*sind(theta),y(j));
       Aeqn2=lineseqn(dist*cosd(theta),x(j+1),dist*sind(theta),y(j+1));
       
        [starting,ending,flag,flagstart,flagend,interval,sideflag,eqnintersect1,Aeqn1,Aeqn2]=figcircle(Aeqn1,Aeqn2,dist,theta,j);
       [storearea2,arr1,arrx2,arry2]=projectc(starting,ending,flag,flagstart,flagend,interval,sideflag,eqnintersect1,Aeqn1,Aeqn2,g);
        
%        starting1=[];ending1=[];flag2=[];flagstart1=[];flagend1=[];interval1=[];sideflag1=[];
        if(isempty(arr1)==0 && arr1(1)==0)
            arr1=[];
            arrx2=[];
            arry2=[];
        end
       if(isempty(arrx2)==0)
                  s1=size(arrx2);
           for k=1:1:s1(1,2)
           [xoo,yoo]=pix(fix(arrx2(k)),fix(arry2(k)),flag,interval);
           arrx2(k)=xoo;
           arry2(k)=yoo;
           end
       else
           arrx2=[];
           arry2=[];
       end
       p=0;h=0;s2=size(arr1);
       if(s2(1,2)~=0)
           
              for k=1:1:(s2(1,2))
                         
                   h=h+1;
%                    if(arr1(h)~=0)
                    array(k)=arr1(h)/g(arrx2(k),arry2(k));
%                    else
%                        array(k)=0;
%                    end
            end 
           
       else
           array=[];
       end
       
        li.add(array);
        p=1;h=0;s2=size(arrx2);array=[];
        if(s2(1,2)~=0)
       for k=1:1:(s2(1,2))
           
           
               
                   h=h+1;
                   array(k)=arrx2(h);
               
       end
        else
            array=[];
       end
       lix.add(array);
       
        p=1;h=0;s2=size(arry2);array=[];
       if(s2(1,2)~=0)
        for k=1:1:(s2(1,2))
           
          
               
                   h=h+1;
                   array(k)=arry2(h);
               end 
       else
           array=[];
       end
        liy.add(array); 
        a(z,j)=storearea2;
              end
              z=z+1;
       end
       
       figure('Name','Original image')
imshow(zz,[0,128])
       
       
   toc     
        
        
        
        

        
       

