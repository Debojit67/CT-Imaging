xfin=zeros(400,400);  error(1:11)=0;
k=11;n=512;count=0;y=a;r=[];xrec=[];start=1;lambda=1;temp1=0;noofrot=ite;b3=java.util.LinkedList;
li3=b3.listIterator;
b1=java.util.LinkedList;
li1=b1.listIterator;
bfin=java.util.LinkedList;
li2=bfin.listIterator;
b2=java.util.LinkedList;
li4=b2.listIterator;

tic

for r1=1:1:k,    
%     count=c-1;
 for c=1:1:noofrot,
p=1;count=1;
for t=(n*(c-1)+1):1:n*c,
         r=[];
        if(isempty(b.get(t-1))==0)
            
        r(1,:)=b.get(t-1);
                
        s3=size(r);j=s3(1,2);
        
        for mm=1:1:j,
            doo=isnan(r(1,mm));
            if(isnan(r(1,mm))==1)
                r(1,mm)=0;
            end
          
        end
        
        if(r1==1)
        for t1=1:1:j,
         xrec(1,t1)=20;
         
        end
        end
        if(r1~=1)
            temp1=temp1+1;
%             const=n*(r1-1);
            xrec(1,:)=b1.get(temp1-1);
            
        end
        for i=1:1:j,
            
                if(dot(r(1,:),r(1,:))~=0)
                    temp=0;
                    temp=xrec(1,i);
                temp=temp+lambda*(y(c,p)-dot(r(1,:),xrec(1,:)))*r(1,i)/dot(r(1,:),r(1,:));
%                  if(temp>0)
                xrec(1,i)=temp;
             
                
                else
                     xrec(1,i)=xrec(1,i);
                    
                end
        end
        count=count+1;
        b1.add(xrec);
        b2.add(xrec);
        
        end
         if(isempty(b.get(t-1))==1)
             b1.add(0);
             b2.add(0);
         end
         if(isempty(b.get(t-1))==1&&r1~=1)
             temp1=temp1+1;
         end
        xrec=[];r=[];
        p=p+1;
     end
     
      
 end
%%%%%%%%%%%%%%%%%%%%%%%

arrnew1=zeros(256,256);temparr=[];
counter=0;xoo=0;yoo=0;
for j=1:1:noofrot,
%      j=2;
   for i=1:1:512,
%         i=2i85;
        if(isempty(b2.get(counter))==0)
    temparr(1,:)=b2.get(counter);
    s=size(temparr);t=s(1,2);
          
    xcor=bx.get(counter); ycor=by.get(counter);
    s=size(xcor);t3=s(1,1);
    for z=1:1:t3,
        xx=fix(xcor(z,:));yy=fix(ycor(z,:));
        if(abs(g(xx,yy)-temparr(1,z))<abs(g(xx,yy)-arrnew1(xx,yy)))
    arrnew1(xx,yy)=temparr(1,z);
        else
            arrnew1(xx,yy)=arrnew1(xx,yy);
        end
    end
    temparr=[];
    counter=counter+1;
        end
   end
end
  
%%%%%%%%%%%%%%%%%%%%%%%

arrnew2(:,:,r1)=arrnew1;
arrnew1=[];
b2=java.util.LinkedList;
li4=b2.listIterator;
end
figure('Name','Reconstructed image')
imshow(arrnew2(:,:,11),[0,128])

toc