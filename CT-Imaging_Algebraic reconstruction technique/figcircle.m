function [starting,ending,flag,flagstart,flagend,interval,sideflag,eqnintersect1,Aeqn1,Aeqn2]=figcircle(Aeqn1,Aeqn2,dist,theta,j)
        starting=[];ending=[];flag1=0;fk=0;p1=1;p2=1;ray1=[];ray2=[];flagstart=0;woo=0;flagend=0;kg=0;eqnintersect1=[];tempd=0;kgb=0;kgg=0;xm781=0;xm782=0;x781=0;x782=0;y781=0;y782=0;y221=0;y222=0;
        sideflag=0;flag=0;interval=0;
%     case 1
            flagstart=0;flagend=0;
          p=1;
          h(1,1)=Aeqn1(1);
          h(1,2)=Aeqn1(2);
          h(2,1)=1;
          h(2,2)=0;
          z(1,1)=Aeqn1(3);
          z(2,1)=-110;
          
          h1(1,1)=Aeqn2(1);
          h1(1,2)=Aeqn2(2);
          h1(2,1)=1;
          h1(2,2)=0;
          z1(1,1)=Aeqn2(3);
          z1(2,1)=-110;
          temp=isinf(linsolve(h,z));
          j1=linsolve(h,z);
          j2=linsolve(h1,z1);
          temp1=isinf(linsolve(h1,z1));
          if(temp(1:2)==0)
              if(j1(2,1)>=-110 && j1(2,1)<=110)
              eqnintersect1(:,p)=linsolve(h,z);
              
              p=p+1;
              ray1(:,p1)=linsolve(h,z);
              p1=p1+1;
              fk=1;
              xm781=1;
              end
          end
          if(temp1(1:2)==0)
              if(j2(2,1)>=-110 && j2(2,1)<=110)
              eqnintersect1(:,p)=linsolve(h1,z1);
              ray2(:,p2)=linsolve(h1,z1);
              p2=p2+1;
              
              p=p+1;
              kg=1;xm782=1;
              end
          end
          if(fk==1 && kg~=1)
              flag1=flag1+1;
              check='x';
              kgg=1;
          elseif(fk~=1 && kg==1)
              flag1=flag1+1;
              check='x';
              kgb=1;
          end
          %     case 2
         fk=0;kg=0;
          h(1,1)=Aeqn1(1);
          h(1,2)=Aeqn1(2);
          h(2,1)=1;
          h(2,2)=0;
          z(1,1)=Aeqn1(3);
          z(2,1)=110;
          
          h1(1,1)=Aeqn2(1);
          h1(1,2)=Aeqn2(2);
          h1(2,1)=1;
          h1(2,2)=0;
          z1(1,1)=Aeqn2(3);
          z1(2,1)=110;
          temp=isinf(linsolve(h,z));
          j1=linsolve(h,z);
          j2=linsolve(h1,z1);
          temp1=isinf(linsolve(h1,z1));
          if(temp(1:2)==0)
              if(j1(2,1)>=-110 && j1(2,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h,z);
              p=p+1;
              fk=1;x781=1;ray1(:,p1)=linsolve(h,z);
              p1=p1+1;
              end
          end
          if(temp1(1:2)==0)
              if(j2(2,1)>=-110 && j2(2,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h1,z1);
              p=p+1;
              kg=1;x782=1;ray2(:,p2)=linsolve(h1,z1);
              p2=p2+1;
              end
          end
         if(fk==1 && kg~=1)
              flag1=flag1+1;
              check='x';
              kgg=1;
          elseif(fk~=1 && kg==1)
              flag1=flag1+1;
              check='x';
              kgb=1;
          end
           %     case 3
          fk=0;kg=0;
          h(1,1)=Aeqn1(1);
          h(1,2)=Aeqn1(2);
          h(2,1)=0;
          h(2,2)=1;
          z(1,1)=Aeqn1(3);
          z(2,1)=110;
          
          h1(1,1)=Aeqn2(1);
          h1(1,2)=Aeqn2(2);
          h1(2,1)=0;
          h1(2,2)=1;
          z1(1,1)=Aeqn2(3);
          z1(2,1)=110;
          temp=isinf(linsolve(h,z));
          j1=linsolve(h,z);
          j2=linsolve(h1,z1);
          temp1=isinf(linsolve(h1,z1));
          if(temp(1:2)==0)
              if(j1(1,1)>=-110 && j1(1,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h,z);
              p=p+1;
              fk=1;y781=1;ray1(:,p1)=linsolve(h,z);
              p1=p1+1;
              end
          end
          if(temp1(1:2)==0)
              if(j2(1,1)>=-110 && j2(1,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h1,z1);
              p=p+1;kg=1;y782=1;
              ray2(:,p2)=linsolve(h1,z1);
              p2=p2+1;
              end
          end
           if(fk==1 && kg~=1)
              flag1=flag1+1;
              check='y';kgg=1;
          elseif(fk~=1 && kg==1)
              flag1=flag1+1;
              check='y';kgb=1;
          end
%            case 4
          fk=0;kg=0;
          h(1,1)=Aeqn1(1);
          h(1,2)=Aeqn1(2);
          h(2,1)=0;
          h(2,2)=1;
          z(1,1)=Aeqn1(3);
          z(2,1)=-110;
          
          h1(1,1)=Aeqn2(1);
          h1(1,2)=Aeqn2(2);
          h1(2,1)=0;
          h1(2,2)=1;
          z1(1,1)=Aeqn2(3);
          z1(2,1)=-110;
          temp=isinf(linsolve(h,z));
          j1=linsolve(h,z);
          j2=linsolve(h1,z1);
          temp1=isinf(linsolve(h1,z1));
          if(temp(1:2)==0)
              if(j1(1,1)>=-110 && j1(1,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h,z);
              p=p+1;fk=1;y221=1;ray1(:,p1)=linsolve(h,z);
              p1=p1+1;
              end
          end
          if(temp1(1:2)==0)
              if(j2(1,1)>=-110 && j2(1,1)<=110)
                  
              eqnintersect1(:,p)=linsolve(h1,z1);
              p=p+1;kg=1;y222=1;ray2(:,p2)=linsolve(h1,z1);
              p2=p2+1;
              end
          end
           if(fk==1 && kg~=1)
              flag1=flag1+1;
              check='y';kgg=1;
          elseif(fk~=1 && kg==1)
              flag1=flag1+1;
              check='y';kgb=1;
          end
           xcentre=dist*cosd(theta);
           ycentre=dist*sind(theta);
           
            a=size(eqnintersect1);
            kk=0;
            if(a(1,2)==2)
            if((eqnintersect1(1,1)==eqnintersect1(1,2))&&(eqnintersect1(2,1)==eqnintersect1(2,2)))
                kk=1;
            end
            end
           if (a(1,2)==4)
               sideflag=0;
               
          
             for i=1:1:2,
               tempd(i)=pdist([xcentre,ycentre;ray1(1,i),ray1(2,i)],'euclidean');
               end
               if(tempd(1)<tempd(2))
               starting(:,1)=ray1(:,1);
               ending(:,1)=ray1(:,2);
               else
                   starting(:,1)=ray1(:,2);
               ending(:,1)=ray1(:,1);
               end
               for i=1:1:2,
               tempd(i)=pdist([xcentre,ycentre;ray2(1,i),ray2(2,i)],'euclidean');
               end
               if(tempd(1)<tempd(2))
               starting(:,2)=ray2(:,1);
               ending(:,2)=ray2(:,2);
               else
                   starting(:,2)=ray2(:,2);
               ending(:,2)=ray2(:,1);
               end
            bb=abs((atand(Aeqn1(1)*-1)));
        if(bb>=0 && bb<=45)
            flag='x';
            if(starting(1,1)>ending(1,1))
                interval=-1;
            else
                interval=1;
            end
        else
            flag='y';
            if(starting(1,2)>ending(1,2))
                interval=-1;
            else
                interval=-1;
            end
        end
           starting(1,1)=signi(starting(1,1));
           starting(1,2)=signi(starting(1,2));
           starting(2,1)=signi(starting(2,1));
           starting(2,2)=signi(starting(2,2));
           ending(1,1)=signi(ending(1,1));
           ending(1,2)=signi(ending(1,2));
           ending(2,1)=signi(ending(2,1));
           ending(2,2)=signi(ending(2,2));
           elseif(a(1,2)==2 && kk==1)
               sideflag=2;
               starting=[];
               ending=[];
               flag='s';
               interval=3;
            elseif(a(1,2)==2)
                
               sideflag=1;
               for i=1:1:2,
               tempd(i)=pdist([xcentre,ycentre;eqnintersect1(1,i),eqnintersect1(2,i)],'euclidean');
               end
               if(tempd(1)<tempd(2))
               starting(:,1)=eqnintersect1(:,1);
               ending(:,1)=eqnintersect1(:,2);
               else
                   starting(:,1)=eqnintersect1(:,2);
               ending(:,1)=eqnintersect1(:,1);
               end
           aa=lineseqn(starting(1,1),ending(1,1),starting(2,1),ending(2,1));    
                bb=abs((atand(aa(1)*-1)));
        if(bb>=0 && bb<=45)
            flag='x';
            if(starting(1,1)>ending(1,1))
                interval=-1;
            else
                interval=1;
            end
        else
            flag='y';
            if(starting(2,1)>ending(2,1))
                interval=-1;
            else
                interval=1;
            end
        end
        if(xm781==1 && y221==1)
            if(interval==1 && flag=='y')
                Aeqn2=[1 0 -110];
                ending(:,2)=ending(:,1);
                starting(:,2)=[-110;-110];
                woo=1;
            elseif(interval==-1 && flag=='x')
                Aeqn2=[0 1 -110];
                starting(:,2)=starting(:,1);
                ending(:,2)=[-110;-110];woo=1;
            end
            elseif(xm782==1 && y222==1)
            if(interval==-1 && flag=='y')
                Aeqn1=[1 0 -110];
                starting(:,2)=starting(:,1);
                ending(:,2)=ending(:,1);woo=1;
                ending(:,1)=[-110;-110];
            elseif(interval==1 && flag=='x')
                Aeqn1=[0 1 -110];
                starting(:,2)=starting(:,1);
                starting(:,2)=[-110,-110];woo=1;
                ending(:,2)=ending(:,1);
                
            end
        elseif(x781==1 && y221==1)
            if(interval==-1 && flag=='y')
                Aeqn2=[1 0 110];woo=1;
                starting(:,2)=starting(:,1);
                ending(:,2)=[110;-110];
            elseif(interval==-1 && flag=='x')
                Aeqn2=[0 1 -110];
                
                ending(:,2)=ending(:,1);
                starting(:,2)=[110;-110];woo=1;
            end
            elseif(x782==1 && y222==1)
            if(interval==1 && flag=='y')
                Aeqn1=[1 0 110];
                starting(:,2)=starting(:,1);
                starting(:,1)=[110;-110];
                ending(:,2)=ending(:,1);woo=1;
            
            elseif(interval==1 && flag=='x')
                Aeqn1=[0 1 -110];
                starting(:,2)=starting(:,1);
               
                ending(:,2)=ending(:,1);
                ending(:,1)=[110,-110];woo=1;
                
            end
        elseif(x781==1 && y781==1)
            if(interval==-1 && flag=='y')
                Aeqn2=[1 0 110];
                starting(:,2)=[110,110];
                
                ending(:,2)=ending(:,1);woo=1;
            elseif(interval==1 && flag=='x')
                Aeqn2=[0 1 110];
                
                ending(:,2)=[110,110];woo=1;
                starting(:,2)=starting(:,1);
            end
            elseif(x782==1 && y782==1)
            if(interval==1 && flag=='y')
                Aeqn1=[1 0 110];
                starting(:,2)=starting(:,1);
%                 starting(:,1)=[78;22];
                ending(:,2)=ending(:,1);
                ending(:,1)=[110,110];woo=1;
            
            elseif(interval==-1 && flag=='x')
                Aeqn1=[0 1 110];
                starting(:,2)=starting(:,1);
                starting(:,1)=[110,110];woo=1;
                ending(:,2)=ending(:,1);
            
                
            end
        elseif(xm781==1 && y781==1)
            if(interval==1 && flag=='y')
                Aeqn2=[1 0 -110];
                ending(:,2)=[-110,110];
                
                starting(:,2)=starting(:,1);woo=1;
            elseif(interval==1 && flag=='x')
                Aeqn2=[0 1 110];
                
                starting(:,2)=[-110,110];
                ending(:,2)=ending(:,1);woo=1;
            end
            elseif(xm782==1 && y782==1)
            if(interval==-1 && flag=='y')
                Aeqn1=[1 0 -110];
                starting(:,2)=starting(:,1);
                 starting(:,1)=[-110;110];
                ending(:,2)=ending(:,1);woo=1;
            
            
            elseif(interval==-1 && flag=='x')
                Aeqn1=[0 1 110];
                starting(:,2)=starting(:,1);
%                 starting(:,1)=[78,78];
                ending(:,2)=ending(:,1);woo=1;
                ending(:,1)=[-110,110];
            
           return
                
            end   
        else
            woo=0;
            if(starting(1,1)>0 && starting(2,1)>0)
                   starting(:,2)=ceil(starting(:,1));
               elseif(starting(1,1)>0 && starting(2,1)<0)
                   starting(1,2)=ceil(starting(1,1));
                   starting(2,2)=floor(starting(2,1));
               elseif(starting(1,1)<0 && starting(2,1)>0)
                   starting(1,2)=floor(starting(1,1));
                   starting(2,2)=ceil(starting(2,1));
               else
                   starting(:,2)=floor(starting(:,1));
               end
               if(ending(1,1)>0 && ending(2,1)>0)
                   ending(:,2)=ceil(ending(:,1));
               elseif(ending(1,1)>0 && ending(2,1)<0)
                   ending(1,2)=ceil(ending(1,1));
                   ending(2,2)=floor(ending(2,1));
               elseif(ending(1,1)<0 && ending(2,1)>0)
                   ending(1,2)=floor(ending(1,1));
                   ending(2,2)=ceil(ending(2,1));
               else
                   ending(:,2)=floor(ending(:,1));
               end
        
                
                         bb=abs((atand(aa(1)*-1)));
        if(bb>=0 && bb<=45)
            flag='x';
            if(starting(1,1)>ending(1,1))
                interval=-1;
            else
                interval=1;
            end
        else
            flag='y';
            if(starting(2,1)>ending(2,1))
                interval=-1;
            else
                interval=1;
            end
        end    
               
              
                    if(kgb==1 && woo==0)
                   if(starting(1,1)==-110)
                           Aeqn1=[1 0 -110];
                       elseif(starting(1,1)==110)
                           Aeqn1=[1 0 110];
                       elseif(starting(2,1)==110)
                           Aeqn1=[0 1 110];
                       elseif(starting(2,1)==-110)
                           Aeqn1=[0 1 -110];
                   end
                    elseif(kgg==1 && woo==0)
                        if(starting(1,1)==-110)
                           Aeqn2=[1 0 -110];
                       elseif(starting(1,1)==110)
                           Aeqn2=[1 0 110];
                       elseif(starting(2,1)==110)
                           Aeqn2=[0 1 110];
                       elseif(starting(2,1)==-110)
                           Aeqn2=[0 1 -110];
                        end
                    end
        end
        starting(1,1)=signi(starting(1,1));
           starting(1,2)=signi(starting(1,2));
           starting(2,1)=signi(starting(2,1));
           starting(2,2)=signi(starting(2,2));
           ending(1,1)=signi(ending(1,1));
           ending(1,2)=signi(ending(1,2));
           ending(2,1)=signi(ending(2,1));
           ending(2,2)=signi(ending(2,2));
               
                        
           elseif(a(1,2)==0)
               sideflag=2;
               starting=[];
               ending=[];
               flag='s';
               interval=3;
           end
          
  if(sideflag==0)         
 if(flag1==0)
     if(starting(1,1)==-110 && starting(1,2)==-110)
         
         flagstart=0;
         flagend=0;
     elseif(starting(1,1)==110 && starting(1,2)==110)
         
         flagstart=0;
         flagend=0;
     elseif(starting(2,1)==110 && starting(2,2)==110)
         
         flagstart=0;
         flagend=0;
     elseif(starting(2,1)==-110 && starting(2,2)==-110)
         
         flagstart=0;
         flagend=0;
     end
elseif(flag1==2)
    if(starting(1,1)~=starting(1,2) && starting(2,1)~=starting(2,2))
        if(starting(1,1)==-110 || starting(1,2)==-110)
           
            flagstart=1;
            flagend=0;
        elseif(starting(1,1)==110 || starting(1,2)==110)
            
            flagstart=1;
            flagend=0;
        elseif(starting(2,1)==110 || starting(2,2)==110)
            
            flagstart=1;
            flagend=0;
        elseif(starting(2,1)==-110 || starting(2,2)==-110)
        
            flagstart=1;
            flagend=0;
        end
    else
        if(starting(1,1)==-110 && starting(1,2)==-110)
         flagstart=0;
         flagend=1;
     elseif(starting(1,1)==110 && starting(1,2)==110)
         
         flagstart=0;
         flagend=1;
     elseif(starting(2,1)==110 && starting(2,2)==110)
         
         flagstart=0;
         flagend=1;
     elseif(starting(2,1)==-110 && starting(2,2)==-110)
         
         flagstart=0;
         flagend=1;
        end
    end
elseif(flag1==4)
    if(starting(1,1)~=starting(1,2) && starting(2,1)~=starting(2,2))
        if(starting(1,1)==-110 || starting(1,2)==-110)
          
            flagstart=1;
            flagend=1;
        elseif(starting(1,1)==110 || starting(1,2)==110)
         
            flagstart=1;
            flagend=1;
        elseif(starting(2,1)==110 || starting(2,2)==110)
        
            flagstart=1;
            flagend=1;
        elseif(starting(2,1)==-110 || starting(2,2)==-110)
          
            flagstart=1;
            flagend=1;
        end
    end
 end
  
  
  end
  
            
            
  end
    