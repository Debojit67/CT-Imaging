function [storearea1,arr,arrx1,arry1]=projectc(starting,ending,flag,flagstart,flagend,interval,sideflag,eqnintersect1,Aeqn1,Aeqn2,g)
storearea1=0;p=1;arr=0;arrx1=0;arry1=0;kgxs=0;kgxe=0;kgys=0;kgye=0;xoo=0;yoo=0;ch=0;kgxse=0;kgxee=0;
if(sideflag==2 || sideflag==1)
    storearea1=0;
    arr=[];
    arrx1=[];
    arry1=[];
 elseif(sideflag==1000)
     
    if(flag=='y')
        chy=1;
     if(starting(:,1)==starting(:,2))
        
         if(interval==-1)
             sp=ceil(starting(2,1));
         else
             sp=floor(starting(2,1));
         end
            
    
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);interval+sp]);
         next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);interval+sp]);
        
        arrx1(p)=starting(1,1);
        arry1(p)=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
            storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        p=p+1;
     else
    sp=starting(1,2);
    sp=sp-interval;
     end
     if(ending(:,1)==ending(:,2))
         ch=1;
          if(interval==-1)
             ep=ceil(ending(2,1));
         else
             ep=floor(ending(2,1));
         end
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep-interval]);
    next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep-interval]);
    
        
        Tarrx1=starting(1,1);
        Tarry1=starting(2,1);
        
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
     else
         ep=ending(2,1)+interval;
     end
    elseif(flag=='x')
        chx=1;
        if(starting(:,1)==starting(:,2))
         if(interval==-1)
             sp=ceil(starting(1,1));
         else
             sp=floor(starting(1,1));
         end
          
    
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);interval+sp]);
          next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);interval+sp]);
        arrx1(p)=starting(1,1);
        arry1(p)=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        
        p=p+1;
       
    else
        sp=starting(2,1)+interval;
        end
    if(ending(:,1)==ending(:,2))
        ch=1;
          if(interval==-1)
             ep=ceil(ending(1,1));
         else
             ep=floor(ending(1,1));
         end
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep-interval]);
    next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep-interval]);
    
        Tarrx1=starting(1,1);
        Tarry1=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        storearea1=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
    else
         ep=ending(2,1)+interval;
     end
    
        
end


    
%     storearea1=storearea1+polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arr(p)=polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arrx(p)=eqnintersect(1,1);
%     arry(p)=eqnintersect2(1,1);
%     p=p+1;
elseif(sideflag==0 )
    if(flag =='x')
   if(ending(1,1)>ending(1,2))
        if(interval==1)
            ep=floor(ending(1,2));
        else
            ep=ceil(ending(1,2));
        end
    else
        if(interval==1)
            ep=ceil(ending(1,1));
        else
            ep=floor(ending(1,1));
        end
    end
       if(starting(1,1)>starting(1,2))
        if(interval==1)
            sp=floor(starting(1,2));
        else
            sp=ceil(starting(1,2));
        end
    else
        if(interval==1)
            sp=ceil(starting(1,1));
        else
            sp=floor(starting(1,1));
        end
    end
         
    
    if(abs(sp-ep)<=1)
        kgxe=1;
    end
    if(sideflag==1)
        if(flag=='y')
        chy=1;
     if(starting(:,1)==starting(:,2))
        
            
    
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);interval+sp]);
         next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);interval+sp]);
        
        arrx1(p)=floor(starting(1,1));
        arry1(p)=ceil(starting(2,1));
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
            storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
        p=p+1;
     else
%     sp=starting(1,2);
    sp=sp-interval;
     end
     if(ending(:,1)==ending(:,2))
         ch=1;
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep-interval]);
    next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep-interval]);
    
        
        Tarrx1=floor(next1(1,1));
        Tarry1=ceil(next1(2,1));
        
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
     else
         ep=ep+interval;
     end
    elseif(flag=='x')
        chx=1;
        if(starting(:,1)==starting(:,2))
          
    
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);interval+sp]);
          next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);interval+sp]);
        arrx1(p)=floor(starting(1,1));
        arry1(p)=ceil(starting(2,1));
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
        
        p=p+1;
       
    else
        sp=sp+interval;
        end
    if(ending(:,1)==ending(:,2))
        ch=1;
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep]);
    next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep]);
    
        Tarrx1=floor(next1(1,1));
        Tarry1=ceil(next1(2,1));
        [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
        storearea1=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
    else
         ep=ep+interval;
     end
    
        
end


    
%     storearea1=storearea1+polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arr(p)=polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arrx(p)=eqnintersect(1,1);
%     arry(p)=eqnintersect2(1,1);
%     p=p+1;
    end
    if(sideflag==0)
    start1=starting(:,1);
    start2=starting(:,2);
    end1=ending(:,1);
    end2=ending(:,2);
    next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);interval+sp]);
    next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);interval+sp]);
    prv1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep-interval]);
    prv2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep-interval]);
    if(starting(2,1)==starting(2,2)*100)
         if(abs(fix(starting(1,1))-fix(starting(1,2)))>=1)
              if((fix(starting(1,1))<fix(starting(2,1))))
                 arrx1(p)=floor(sp);
                 if(interval==1)
                 arry1(p)=ceil(starting(2,1)+1);
                 else
                  arry1(p)=ceil(starting(2,1));
                 end
                 [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                 prv1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);sp+interval]);
                 arr(p)=polyarea([starting(1,1),sp,prv1(1,1)],[starting(2,1),prv1(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
                 storearea1=storearea1+arr(p);
                 kgxse=1;
                 p=p+1;
              else
                  arrx1(p)=floor(sp);
                  if(interval==1)
                 arry1(p)=ceil(starting(2,2)+1);
                  else
                      arry1(p)=ceil(starting(2,2));
                  end
                 [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                 prv1=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);sp+interval]);
                 arr(p)=polyarea([starting(1,2),sp,prv1(1,1)],[starting(2,2),prv1(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
                  storearea1=storearea1+arr(p);
                  p=p+1;
                 kgxse=1;
              end
         else
        arrx1(p)=floor(starting(1,1));
        arry1(p)=ceil(starting(2,1));
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        storearea1=storearea1+polyarea([starting(1,1),starting(1,1),next2(1,1),next1(1,1)],[starting(2,1),starting(2,2),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
         
        arr(p)=polyarea([starting(1,1),starting(1,1),next2(1,1),next1(1,1)],[starting(2,1),starting(2,2),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
        kgxse=1;p=p+1;
         end
    end

    if(flagstart==0 && kgxse~=1)
        sp=sp-interval;
    elseif(flagstart==1)
         
        arrx1(p)=floor(start1(1,1));
        arry1(p)=ceil(start1(2,1));
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
         storearea1=storearea1+polyarea([start1(1,1),start2(1,1),start2(1,1),next2(1,1),next1(1,1)],[start1(2,1),start1(2,1),start2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
        arr(p)=polyarea([start1(1,1),start2(1,1),start2(1,1),next2(1,1),next1(1,1)],[start1(2,1),start1(2,1),start2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
        p=p+1;
    end       
     if(ending(2,1)==ending(2,2)*100)
         if(abs(fix(ending(1,1))-fix(ending(1,2)))>=1)
              if((fix(ending(1,1))<fix(ending(1,2))))
                 Tarrx1=floor(ep-interval);
                 Tarry1=ceil(ending(2,2));
                 [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                 prv1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep-interval]);
                 Tarr=polyarea([ending(1,1),ep,prv1(1,1)],[ending(1,2),prv1(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
                  storearea1=storearea1+Tarr;
               kgxee=1;
              else
                  Tarrx1=floor(ep-interval);
                 Tarry1=ceil(ending(2,1));
                 [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                 prv1=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep-interval]);
                 Tarr=polyarea([ending(1,2),ep,prv1(1,1)],[ending(2,2),prv1(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
                  storearea1=storearea1+Tarr;
               kgxee=1;
              end
         else
             
         prv1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep-interval]);
         prv2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep-interval]);
%          storearea1=storearea1+polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)]);
         
        Tarrx1=floor(prv1(1,1));
        Tarry1=ceil(prv1(2,1));
        [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                Tarr=polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
                    storearea1=storearea1+Tarr;
       kgxee=1;
%         p=p+1;
%         storearea1=storearea1+polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
         
%         arr(p)=polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
         end
     end
    if(flagend==0 && kgxee~=1)
        ep=ep+interval;
    elseif(flagend==1 && kgxe~=1)
        ch=1;
%         storearea1=storearea1+polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)]);
%         Tarr=polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)])*g(fix(xoo),fix(yoo));
         Tarrx1=floor(prv1(1,1));
        Tarry1=ceil(prv1(2,1));
        [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
        storearea1=storearea1+polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)])*g(fix(xoo),fix(yoo));
        Tarr=polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
    
    end
    end
%     end
    if(kgxe~=1 )
    for i=(sp + interval):interval:(ep-interval*2),
        
        cur1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);i]);
        cur2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);i]);
        next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);i+interval]);
        next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);i+interval]);
        if(abs(next1(2,1))>110)
            next1(2,1)=next1(2,1)/abs(next1(2,1))*110;
        elseif(abs(next2(2,1))>110)
            next2(2,1)=next2(2,1)/abs(next2(2,1))*110;
        end
        if(fix(cur1(2,1))==fix(cur2(2,1)))
            if(fix(next1(2,1))==fix(next2(2,1)))
%             storearea=storearea+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
%             elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
                
                if(fix(next1(2,1))==fix(cur1(2,1)) && fix(next2(2,1))==fix(cur2(2,1)))
                   
                   arrx1(p)=floor(cur1(1,1));
                   arry1(p)=ceil(cur1(2,1));
                   [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                   storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   p=p+1;
                else
                    
                        temp=bet(next1(2,1),next2(2,1));
                    
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                    hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                    if(hk==1 && gk==1)
                        if((temp2(1,1)) > (temp1(1,1)))
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        
                        storearea1=storearea1+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)]);
                        arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                        arrx1(p)=floor(cur1(1,1));
                       arry1(p)=ceil(cur1(2,1))+interval;
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       storearea1=storearea1+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                       arr(p)= polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));     
                       p=p+1;
                        else
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    end
                end
            elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))== next2(2,1))
                if(fix(next1(2,1))==fix(cur1(2,1)) || fix(next2(2,1))==fix(cur2(2,1)))
                   
                  arrx1(p)=floor(cur1(1,1));
                   arry1(p)=ceil(cur1(2,1));
                   [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                   storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                  arr(p)= polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                  p=p+1;
                end

            elseif( (fix(next1(2,1))~= fix(cur1(2,1)) || fix(next2(2,1))~= fix(cur2(2,1))))
              temp=bet(next2(2,1),next1(2,1));
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                    hk=0;gk=0;
                    
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                    if(hk~=1 && gk~=1)
                      
                      arrx1(p)=floor(cur1(1,1));
                      arry1(p)=ceil(cur1(2,1));
                      [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                      storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                      arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                      p=p+1;
                    elseif(hk==1 && gk==1)
                        if((temp2(1,1)) > (temp1(1,1)))
                        
                        if(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
                        
                        arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        
                        storearea1=storearea1+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)]);
                        arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                        arrx1(p)=floor(cur1(1,1));
                       arry1(p)=ceil(cur1(2,1))+interval;
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       storearea1=storearea1+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                       arr(p)= polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));     
                       p=p+1;
                        elseif(fix(next1(2,1))~=fix(next2(2,1)))
                             
                                tempo3=bet(cur1(2,1),cur2(2,1));
                            
                            temp3=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])+polyarea([temp1(1,1),temp2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp2(2,1),temp3(2,1),next1(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            
                            
                             arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),temp2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp2(2,1),temp3(2,1),next1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                             arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+2*interval;
                            p=p+1;
%                         storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                         
                        else
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           p=p+1;
                        end
                        else
                            if(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
%                         storearea1=storearea1+polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                            elseif(fix(next1(2,1))~=fix(next2(2,1)))
                             
                                tempo3=bet(next1(2,1),next2(2,1));
                             
                            temp3=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);tempo3]);
%                             storearea1=storearea1+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])+polyarea([temp2(1,1),temp1(1,1),temp3(1,1),temp3(1,1),next2(1,1)],[temp2(2,1),temp1(2,1),temp3(2,1),next1(2,1),next2(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                                arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                             arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                                
                                arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([temp2(1,1),temp1(1,1),temp3(1,1),temp3(1,1),next2(1,1)],[temp2(2,1),temp1(2,1),temp3(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                                
                                arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+2*interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                            else
                      
                           arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           p=p+1;
                            end
                        end
                        elseif(hk==1 && gk~=1)
                        if(next2(1,1)==temp2(1,1) && next2(2,1)==temp2(2,1))
%                             storearea1=storearea1+polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)]);
                            
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
%                             p=p+1;
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                        if(next1(1,1)==temp1(1,1) && next1(2,1)==temp1(2,1))
%                             storearea1=storearea1+polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       arr(p)=polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       
                            arr(p)=polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);                           
                            arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);    
                            p=p+1;
                        end
                        
                    else
                      
                           arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           p=p+1;    
                    end
                  else
                      
                           arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           p=p+1;  
            end
        elseif(fix(cur1(2,1))==cur1(2,1) || fix(cur2(2,1))==cur2(2,1))
            if(fix(next1(2,1)==fix(next2(2,1))))
%             storearea=storearea+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
%             elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
                k=1;
                if(fix(next1(2,1))==fix(cur1(2,1)) && fix(next2(2,1))==fix(cur2(2,1)))
                   
                    arrx1(p)=floor(cur1(1,1));
                     arry1(p)=ceil(cur1(2,1));
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                     storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   
                   p=p+1;
                else
                              
                                temp=bet(next1(2,1),next2(2,1));
                             
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                      hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                    if(hk==1 && gk==1)
                        if((temp2(1,1)) > (temp1(1,1)))
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        
                        storearea1=storearea1+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)]);
                        arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                        arrx1(p)=floor(cur1(1,1));
                       arry1(p)=ceil(cur1(2,1))+interval;
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       storearea1=storearea1+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                       arr(p)= polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));     
                       p=p+1;
                        else
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    end
                end
                
            elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))== next2(2,1))
                if(fix(next1(2,1))==fix(cur1(2,1)) || fix(next2(2,1))==fix(cur2(2,1)))
                   
                   arrx1(p)=floor(cur1(1,1));
                     arry1(p)=ceil(cur1(2,1));
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                     storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                   p=p+1;
                end

            elseif( (fix(next1(2,1))~= fix(cur1(2,1)) || fix(next2(2,1))~= fix(cur2(2,1))))
%                     temp=ceil(min(cur1(2,1),cur2(2,1),next1(2,1),next2(2,1)));
                             
                                temp=bet(next1(2,1),next2(2,1));
                             
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                      hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                    if(hk~=1 && gk~=1)
                      arrx1(p)=floor(cur1(1,1));
                     arry1(p)=ceil(cur1(2,1));
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                     storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                      arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                      
                      p=p+1;
                    elseif(hk==1 && gk==1)
%                         storearea1=storearea1+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                        arrx1(p)=floor(cur1(1,1));
                     arry1(p)=ceil(cur1(2,1));
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              
                     arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                         p=p+1;
                        arrx1(p)=floor(cur1(1,1));
                     arry1(p)=ceil(cur1(2,1))+interval;
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                             
                     arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                    elseif(hk==1 && gk~=1)
                        if(next2(1,1)==temp2(1,1) && next2(2,1)==temp2(2,1))
%                             storearea1=storearea1+polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                      
                            arr(p)=polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       
                            arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              
                            arr(p)=polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                        if(next1(1,1)==temp1(1,1) && next1(2,1)==temp1(2,1))
%                             storearea1=storearea1+polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       
                            arr(p)=polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                               
                            arr(p)=polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+interval; 
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                   
                            arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                        
                    end
                    else
                      
                           arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           p=p+1;
            end
        elseif(fix(cur1(2,1)) ~= fix(cur2(2,1)))
%             temp=ceil(min(cur1(2,1),cur2(2,1),next1(2,1),next2(2,1)));
            temp=bet(cur1(2,1),cur2(2,1));
           if(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
               temp=bet(cur1(2,1),cur2(2,1));
                    
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                        hk=0;gk=0;kh=0;kg=0;
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                    if(next1(2,1)==temp1(2,1))
                        kh=1;
                    end
                    
                    if(next2(2,1)==temp2(2,1))
                        kg=1;
                    end
                     if(hk~=1 && gk~=1 && kh==1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp(2,1),temp(2,1),next1(2,1)])+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp,next2(2,1)]);
                        temp4=bet(next1(2,1),next2(2,1));
                        arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur1(1,1),cur1(1,1),next1(1,1)],[cur1(2,1),temp,next1(2,1)])*g(fix(xoo),fix(yoo));

                          p=p+1;
                        arrx1(p)=floor(cur2(1,1));
                        arry1(p)= ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur2(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp,cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                          
                          storearea1=storearea1+arr(p)+arr(p-1);
                          p=p+1;
                     elseif(hk~=1 && gk~=1 && kg==1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp(2,1),temp(2,1),next1(2,1)])+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp,next2(2,1)]);
                        temp4=bet(next1(2,1),next2(2,1));
                        arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur2(1,1),cur2(1,1),next2(1,1)],[cur2(2,1),temp,next2(2,1)])*g(fix(xoo),fix(yoo));

                          p=p+1;
                        arrx1(p)=floor(cur1(1,1));
                        arry1(p)= ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur1(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp,cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));

                          
                          storearea1=storearea1+arr(p)+arr(p-1);
                          p=p+1;
                     
                     elseif(hk==1 && gk~=1)
                        if(fix(next2(2,1))==fix(next1(2,1)))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                     
                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1))+interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                                                        p=p+1;
                        elseif(fix(next2(2,1))==next2(2,1))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                    arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                                                    p=p+1;
                        elseif(fix(next1(2,1))~= fix(next2(2,1)))
                            
                        tempo3=bet(next1(2,1),next2(2,1));
                            
                            temp3=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),temp3(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                             
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                    
                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),temp3(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+2*interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                           storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                        end
                     elseif(hk==1 && gk==1)
                         if(abs(cur2(2,1)-temp)>abs(cur1(2,1)-temp))
                         arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([cur2(2,1),cur2(1,1),next2(1,1)],[temp,cur2(2,1),next2(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur1(1,1),next1(1,1),next2(1,1)],[cur1(2,1),next1(2,1),next2(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         else
                             arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([cur1(2,1),cur1(1,1),next1(1,1)],[temp,cur1(2,1),next1(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),next2(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         end
                        elseif(gk==1 && hk~=1)
                           if(fix(next1(2,1))==fix(next2(2,1)))
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        
                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                            arrx1(p)=ceil(cur1(1,1));
                        arry1(p)=floor(cur1(2,1))+2*interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                           elseif(fix(next1(2,1))==next1(2,1))
%                                 storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                                arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                                arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                                storearea1=storearea1+arr(p)+arr(p-1);
                                p=p+1;
                           elseif(fix(next1(2,1))~= fix(next2(2,1)))
                            
                        tempo3=bet(next1(2,1),next2(2,1));
                            
                            temp3=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])+polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1))+interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                           p=p+1;
                           else
%                              storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                                arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                               storearea1=storearea1+arr(p);
                                p=p+1;
                                          
                           end

                     end     

                   
        else
                        temp=bet(cur1(2,1),cur2(2,1));
                    
                    temp1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);temp]);
                        hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(1,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(1,1))==1)
                        gk=1;
                    end
                     if(hk~=1 && gk~=1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp(2,1),temp(2,1),next1(2,1)])+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp,next2(2,1)]);
                        temp4=bet(next1(2,1),next2(2,1));
                        arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp,temp4,next1(2,1)])*g(fix(xoo),fix(yoo));

                          p=p+1;
                        arrx1(p)=floor(cur2(1,1));
                        arry1(p)= ceil(cur2(2,1))+interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp4,next2(2,1)])*g(fix(xoo),fix(yoo));

                          
                          storearea1=storearea1+arr(p)+arr(p-1);
                          p=p+1;
                     elseif(hk==1 && gk~=1)
                        if(fix(next2(2,1))==fix(next1(2,1)))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                     
                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1))+interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                                                        p=p+1;
                        elseif(fix(next2(2,1))==next2(2,1))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                    arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                                                    p=p+1;
                        elseif(fix(next1(2,1))~= fix(next2(2,1)))
                            
                        tempo3=bet(next1(2,1),next2(2,1));
                            
                            temp3=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),temp3(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                       arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                             p=p+1;
                             
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                    
                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),temp3(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                            arry1(p)=ceil(cur1(2,1))+2*interval;
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                           storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                        end
                     elseif(hk==1 && gk==1)
                         if(abs(cur2(2,1)-temp)>abs(cur1(2,1)-temp))
                         arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([cur2(2,1),cur2(1,1),next2(1,1)],[temp,cur2(2,1),next2(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur1(1,1),next1(1,1),next2(1,1)],[cur1(2,1),next1(2,1),next2(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         else
                             arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([cur1(2,1),cur1(1,1),next1(1,1)],[temp,cur1(2,1),next1(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),next2(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         end
                        elseif(gk==1 && hk~=1)
                           if(fix(next1(2,1))==fix(next2(2,1)))
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        
                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                            arrx1(p)=ceil(cur1(1,1));
                        arry1(p)=floor(cur1(2,1))+2*interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                           elseif(fix(next1(2,1))==next1(2,1))
%                                 storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                                arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                                arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                                storearea1=storearea1+arr(p)+arr(p-1);
                                p=p+1;
                           elseif(fix(next1(2,1))~= fix(next2(2,1)))
                            
                        tempo3=bet(next1(2,1),next2(2,1));
                            
                            temp3=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])+polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)]);
                            arrx1(p)=floor(cur2(1,1));
                        arry1(p)=ceil(cur2(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1))+interval;
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                           storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                           p=p+1;
                           else
%                              storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                                arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                               storearea1=storearea1+arr(p);
                                p=p+1;
                                          
                           end

                     end     
                        end
        else
%              storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                    arrx1(p)=floor(cur1(1,1));
                        arry1(p)=ceil(cur1(2,1));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                         arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                         storearea1=storearea1+arr(p); 
                         p=p+1;
                    end
        end
    end
    if(kgxee==1 || ch==1)
        arr(p)=Tarr;
        arrx1(p)=Tarrx1;
        arry1(p)=Tarry1;
%         storearea1=storearea1+Tarr;
    end
%           here comes 'y'              
                    
    else
    check=0;
  if(ending(2,1)>ending(2,2))
        if(interval==1)
            ep=floor(ending(2,2));
        else
            ep=ceil(ending(2,2));
        end
    else
        if(interval==1)
            ep=ceil(ending(2,1));
        else
            ep=floor(ending(2,1));
        end
    end
     if(starting(2,1)>starting(2,2))
        if(interval==1)
            sp=floor(starting(2,2));
        else
            sp=ceil(starting(2,2));
        end
    else
        if(interval==1)
            sp=ceil(starting(2,1));
        else
            sp=floor(starting(2,1));
        end
    end
    hk=0;gk=0;
    start1=starting(:,1);
    start2=starting(:,2);
    end1=ending(:,1);
    end2=ending(:,2);
    next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);interval+sp]);
    next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);interval+sp]);
    prv1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep-interval]);
    prv2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep-interval]);
    if(abs(sp-ep)<1)
        kgye=1;
    end
    if(sideflag==1)
    if(flag=='y')
        chy=1;
     if(starting(:,1)==starting(:,2))
        
    
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);interval+sp]);
         next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);interval+sp]);
        
        arrx1(p)=floor(starting(1,1));
        arry1(p)=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
            storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        p=p+1;
     else
%     sp=starting(1,2);
    sp=sp-interval;
     end
     if(ending(:,1)==ending(:,2))
         ch=1;
          next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep]);
    next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep]);
    
        
        Tarrx1=floor(next1(1,1));
        Tarry1=next1(2,1);
        [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
     else
         ep=ep+interval;
     end
    elseif(flag=='x')
        chx=1;
        if(starting(:,1)==starting(:,2))
          
    
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);interval+sp]);
          next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);interval+sp]);
        arrx1(p)=floor(starting(1,1));
        arry1(p)=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        arr(p)=polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+polyarea([starting(1,1),next1(1,1),next2(1,1)],[starting(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
        
        p=p+1;
       
    else
        sp=sp+interval;
        end
    if(ending(:,1)==ending(:,2))
        ch=1;
          next1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);ep]);
    next2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);ep]);
    
        Tarrx1=floor(next1(1,1));
        Tarry1=next2(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
        storearea1=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(1,1)])*g(fix(xoo),fix(yoo));
        Tarr=polyarea([ending(1,1),next1(1,1),next2(1,1)],[ending(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
%         p=p+1;
    else
         ep=ep+interval;
     end
    
        
end


    
%     storearea1=storearea1+polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arr(p)=polyarea([eqnintersect1(1,1),eqnintersect1(1,2),eqnintersect1(1,2)],[eqnintersect1(1,2),eqnintersect1(2,2),eqnintersect1(2,1)]);
%     arrx(p)=eqnintersect(1,1);
%     arry(p)=eqnintersect2(1,1);
%     p=p+1;    
    end
    if(sideflag==0)
     if(starting(1,1)==starting(1,2)*100)
         if(abs((fix(starting(2,1))-fix(starting(2,2))))>=1)
              if((fix(starting(2,1))<fix(starting(2,2))))
                 if(interval==1)
                  arrx1(p)=floor(starting(1,1));
                 else
                   arrx1(p)=floor(starting(1,1))-1;
                 end
                 arry1(p)=sp;
                 [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                 prv1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);sp+interval]);
                 arr(p)=polyarea([starting(1,1),prv1(1,1),prv1(1,1)],[starting(2,1),sp,prv1(2,1)])*g(fix(xoo),fix(yoo));
                 storearea1=storearea1+arr(p);
                 p=p+1;
                 kgxse=1;
              else
                  
                  if(interval==1)
                  arrx1(p)=floor(starting(1,1));
                  else
                     arrx1(p)=floor(starting(1,1))-1; 
                  end
                 arry1(p)=sp;
                 [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                 prv1=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);sp+interval]);
                 arr(p)=polyarea([starting(1,2),prv1(1,1),prv1(1,1)],[starting(2,2),sp,prv1(2,1)])*g(fix(xoo),fix(yoo));
                 storearea1=storearea1+arr(p);
                 kgxse=1;p=p+1;
              end
         else
         arrx1(p)=floor(starting(1,1));
        arry1(p)=starting(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
%          storearea1=storearea1+polyarea([starting(1,1),starting(1,1),next2(1,1),next1(1,1)],[starting(2,1),starting(2,2),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
         
        arr(p)=polyarea([starting(1,1),starting(1,1),next2(1,1),next1(1,1)],[starting(2,1),starting(2,2),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+arr(p);
        p=p+1;
        kgys=1;
    end
     end
    if(flagstart==0 && kgys~=1)
        sp=sp-interval;

   
    elseif(flagstart==1)
%           storearea1=storearea1+polyarea([start1(1,1),start2(1,1),start2(1,1),next2(1,1),next1(1,1)],[start1(2,1),start1(2,1),start2(2,1),next2(2,1),next1(2,1)]);
            arrx1(p)=floor((start1(1,1)));
                            arry1(p)=fix((start1(2,1)));
                [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                               arr(p)=polyarea([start1(1,1),start2(1,1),start2(1,1),next2(1,1),next1(1,1)],[start1(2,1),start1(2,1),start2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
        
                storearea1=storearea1+arr(p);
                p=p+1;
    end       
     if(ending(1,1)==ending(1,2)*100)
          if(abs(fix(ending(2,1))-fix(ending(2,2)))>=1)
              if((fix(ending(2,1))<fix(ending(2,2))))
                 Tarrx1=floor(ending(1,1));
                 Tarry1=ep-interval;
                 [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                 prv1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep-interval]);
                 Tarr=polyarea([ending(1,1),prv1(1,1),prv1(1,1)],[ending(2,1),ep,prv1(2,1)])*g(fix(xoo),fix(yoo));
                  storearea1=storearea1+Tarr;
               ch=1;  
              else
                  Tarrx1=floor(ending(1,1));
                 Tarry1=ep-interval;
                 [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                 prv1=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep-interval]);
                 Tarr=polyarea([ending(1,2),prv1(1,1),prv1(1,1)],[ending(2,2),ep,prv1(2,1)])*g(fix(xoo),fix(yoo));
                  storearea1=storearea1+Tarr;
               ch=1;  
              end
         
          else
              ch=1;
         prv1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);ep-interval]);
         prv2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);ep-interval]);
%          storearea1=storearea1+polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)]);
         
        Tarrx1=floor(ending(1,1));
        Tarry1=ending(2,1);
        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        Tarr=polyarea([ending(1,1),ending(1,2),prv2(1,1),prv1(1,1)],[ending(2,1),ending(2,2),prv2(2,1),prv1(2,1)])*g(fix(xoo),fix(yoo));

         storearea1=storearea1+Tarr;
%             p=p+1;
         
          end
     end
    if(flagend==0 && ch~=1)
        ep=ep+interval;
    
    elseif(flagend==1)
%         storearea1=storearea1+polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)]);
        Tarrx1=floor((prv1(1,1)));
        Tarry1=fix((prv1(2,1)));
        [xoo,yoo]=pix(Tarrx1,Tarry1,flag,interval);
                Tarr=polyarea([prv1(1,1),end1(1,1),end1(1,1),end2(1,1),prv2(1,1)],[prv1(2,1),end1(2,1),end2(2,1),end2(2,1),prv2(2,1)])*g(fix(xoo),fix(yoo));
        storearea1=storearea1+Tarr;
%         p=p+1;
    
    end
    end
    if(kgye~=1 )
    for i=(sp + interval):interval:(ep-interval*2),
       
        cur1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);i]);
        cur2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);i]);
        next1=linsolve([Aeqn1(1:2);[0 1]],[Aeqn1(3);i+interval]);
        next2=linsolve([Aeqn2(1:2);[0 1]],[Aeqn2(3);i+interval]);
        if(abs(next1(1,1))>110)
            next1(1,1)=next1(1,1)/abs(next1(1,1))*110;
        elseif(abs(next2(1,1))>110)
            next2(1,1)=next2(1,1)/abs(next2(1,1))*110;
        end
        if(fix(cur1(1,1))==fix(cur2(1,1)))
            if(fix(next1(1,1))==fix(next2(1,1)))
%             storearea=storearea+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
%             elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
                
                if(fix(next1(1,1))==fix(cur1(1,1)) && fix(next2(1,1))==fix(cur2(1,1)))
%                    storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                   arrx1(p)=floor((cur1(1,1)));
                    arry1(p)=fix((cur1(2,1)));
                    [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                     arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                    storearea1=storearea1+arr(p);
                    p=p+1;
                else
                    if(interval==-1)
                    if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next2(1,1),cur2(1,1));
                    else
                        temp=bet(next1(1,1),cur1(1,1));
                    end
                    else
                       if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next1(1,1),cur1(1,1));
                    else
                        temp=bet(next2(1,1),cur2(1,1));
                    end 
                    end
                    temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                     hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                    if((temp2(2,1)) > (temp1(2,1)))
                    arrx1(p)=floor((cur1(1,1)));
                         arry1(p)=fix((cur1(2,1)));
                         [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));

                         p=p+1;
                        arrx1(p)=floor((cur1(1,1)))+interval;
                        arry1(p)=fix((cur1(2,1)));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                    else
                        arrx1(p)=floor((cur1(1,1)));
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor((cur1(1,1)))+interval;
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                    end
                end
                
                
            elseif(fix(next1(1,1))==next1(1,1) || fix(next2(1,1))== next2(1,1))
                if(fix(next1(1,1))==fix(cur1(1,1)) || fix(next2(1,1))==fix(cur2(1,1)))
%                    storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                  arrx1(p)=floor((cur1(1,1)));
                    arry1(p)=fix((cur1(2,1)));
                    [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                   
                     arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                    storearea1=storearea1+arr(p);
                    p=p+1;
                   
                end

            elseif( (fix(next1(1,1))~= fix(cur1(1,1)) || fix(next2(1,1))~= fix(cur2(1,1))))
               temp=bet(next2(1,1),next1(1,1));
                    
                    temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                                        hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                    if(hk~=1 && gk~=1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                      arrx1(p)=floor((cur1(1,1)));
                     arry1(p)=fix((cur1(2,1)));
                     [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                      arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                      
                     storearea1=storearea1+arr(p);p=p+1;
                    elseif(hk==1 && gk==1)
                        if((temp2(2,1)) > (temp1(2,1)))
                        
                        if(fix(next1(1,1))==next1(1,1) || fix(next2(1,1))==next2(1,1))
                        arrx1(p)=floor((cur1(1,1)));
                         arry1(p)=fix((cur1(2,1)));
                         [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));

                         p=p+1;
                        arrx1(p)=floor((cur1(1,1)))+interval;
                        arry1(p)=fix((cur1(2,1)));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                        elseif(fix(next1(1,1))~=fix(next2(1,1)))
                             
                                tempo3=bet(cur1(1,1),cur2(1,1));
                             
                            temp3=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])+polyarea([temp1(1,1),temp2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp2(2,1),temp3(2,1),next1(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);

                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));

                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),temp2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp2(2,1),temp3(2,1),next1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+2*interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                    arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                        else
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                      arrx1(p)=floor((cur1(1,1)));
                      arry1(p)=fix((cur1(2,1)));
                      [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                            arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p);
                      p=p+1;
                        end
                        else
                            if(fix(next1(1,1))==next1(1,1) || fix(next2(1,1))==next2(1,1))
%                         storearea1=storearea1+polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                       arrx1(p)=floor((cur1(1,1)));
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor((cur1(1,1)))+interval;
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([next2(1,1),next1(1,1),temp1(1,1)],[next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                            elseif(fix(next1(1,1))~=fix(next2(1,1)))
                             
                                tempo3=bet(next1(1,1),next2(1,1));
                             
                            temp3=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);tempo3]);
                            storearea1=storearea1+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])+polyarea([temp2(1,1),temp1(1,1),temp3(1,1),temp3(1,1),next2(1,1)],[temp2(2,1),temp1(2,1),temp3(2,1),next1(2,1),next2(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp1(1,1)],[temp2(2,1),cur2(2,1),cur1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),temp1(1,1),temp3(1,1),temp3(1,1),next2(1,1)],[temp2(2,1),temp1(2,1),temp3(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+2*interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                            else
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p);
                            p=p+1;
                            
                            end
                        end
                        elseif(hk==1 && gk~=1)
                        if(next2(2,1)==temp2(2,1) && next2(1,1)==temp2(1,1))
%                             storearea1=storearea1+polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                        if(next1(1,1)==temp1(1,1) && next1(2,1)==temp1(2,1))
                            storearea1=storearea1+polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)]);
                            arr(p)=polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            p=p+1;
                            arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                    else
%                             storearea1=storearea1+polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next1(1,1),temp2(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),temp2(1,1),next2(1,1)],[temp2(2,1),next2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                      else
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p);
                            p=p+1;
                    end
            else
                    storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                                    arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                                    arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix(cur1(2,1));           
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            storearea1=storearea1+arr(p); 
                            p=p+1;
            end
            
        elseif(fix(cur1(1,1))==cur1(1,1) || fix(cur2(1,1))==cur2(1,1))
            if(fix(next1(1,1)==fix(next2(1,1))))
%             storearea=storearea+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
%             elseif(fix(next1(2,1))==next1(2,1) || fix(next2(2,1))==next2(2,1))
                k=1;
                if(fix(next1(1,1))==fix(cur1(1,1)) && fix(next2(1,1))==fix(cur1(1,1)))
%                    storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                   arrx1(p)=floor((cur1(1,1)));
                   arry1(p)=fix((cur1(2,1)));
                   [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                      arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p);
                   p=p+1;
                else
                        if(interval==-1)
                    if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next2(1,1),cur2(1,1));
                    else
                        temp=bet(next1(1,1),cur1(1,1));
                    end
                        else
                            if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next1(1,1),cur1(1,1));
                    else
                        temp=bet(next2(1,1),cur2(1,1));
                            end
                        end
                            
                    temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                    hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                    if((temp2(2,1)) > (temp1(2,1)))
                    arrx1(p)=floor((cur1(1,1)));
                         arry1(p)=fix((cur1(2,1)));
                         [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur1(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));

                         p=p+1;
                        arrx1(p)=floor((cur1(1,1)))+interval;
                        arry1(p)=fix((cur1(2,1)));
                        [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                    else
                        arrx1(p)=floor((cur1(1,1)));
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([cur2(1,1),temp2(1,1),temp1(1,1),cur1(1,1)],[cur2(2,1),temp2(2,1),temp1(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor((cur1(1,1)))+interval;
                       arry1(p)=fix((cur1(2,1)));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                              arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                    end
               
                end
            elseif(fix(next1(1,1))==next1(1,1) || fix(next2(1,1))== next2(1,1))
                if(fix(next1(1,1))==fix(cur1(1,1)) || fix(next2(1,1))==fix(cur2(1,1)))
%                    storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                   arrx1(p)=floor((cur1(1,1)));
                   arry1(p)=fix((cur1(2,1)));
                   [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                      arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                    storearea1=storearea1+arr(p);
                   p=p+1;
                end

            elseif( (fix(next1(1,1))~= fix(cur1(1,1)) || fix(next2(1,1))~= fix(cur2(1,1))))
                     if(interval==-1)     
                if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next2(1,1),cur2(1,1));
                    else
                        temp=bet(next1(1,1),cur1(1,1));
                end
                else
                    if((next1(1,1))< (cur1(1,1)))
                        temp=bet(next1(1,1),cur1(1,1));
                    else
                        temp=bet(next2(1,1),cur2(1,1));
                    end
                end
               
%                             temp3=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);tempo3]);
                    temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                        hk=0;gk=0;
                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                    if(hk~=1 && gk~=1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                      arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                            arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        storearea1=storearea1+arr(p);
                            p=p+1;
                    elseif(hk==1 && gk==1)
%                         storearea1=storearea1+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                        arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                                    p=p+1;
                        arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                arr(p)=polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                            
                    elseif(hk==1 && gk~=1)
                        if(next2(1,1)==temp2(1,1) && next2(2,1)==temp2(2,1))
%                             storearea1=storearea1+polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                                    storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                     else
%                             storearea1=storearea1+polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])+polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next2(1,1),next2(1,1),temp1(1,1),cur1(1,1),cur2(1,1)],[next2(2,1),temp1(2,1),temp1(2,1),cur1(2,1),cur2(2,1)])*g(fix(xoo),fix(yoo));
                                    p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                        if(next1(1,1)==temp1(1,1) && next1(2,1)==temp1(2,1))
%                             storearea1=storearea1+polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        else
%                             storearea1=storearea1+polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])+polyarea([temp2(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([next1(1,1),next1(1,1),temp2(1,1),cur2(1,1),cur1(1,1)],[next1(2,1),temp2(2,1),temp2(2,1),cur2(2,1),cur1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),next2(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        end
                        
                    end
                    
            end
        elseif(fix(cur1(1,1)) ~= fix(cur2(1,1)))
%             temp=ceil(min(cur1(2,1),cur2(2,1),next1(2,1),next2(2,1)));
                    
                        temp=bet(cur1(1,1),cur2(1,1));
                    if(fix(next1(1,1))==next1(1,1) || fix(next2(1,1))==next2(1,1))
                        temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                    hk=0;gk=0;kh=0;kg=0'

                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                    if(temp1(1,1)==next1(1,1))
                        kh=1;
                    end
                    if(temp2(1,1)==next2(1,1))
                        kg=1;
                    end
                     if(hk~=1 && gk~=1 && kh==1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp,temp,next1(2,1)])+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp,next2(2,1)]);
%                     elseif(hk==1 && gk==1)
%                         storearea=storearea+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                        arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));                     
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur1(1,1),temp,next1(1,1)],[cur1(2,1),cur1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur2(1,1),next2(1,1),temp],[cur2(2,1),cur2(2,1),next2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                       storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                     elseif(hk~=1 && gk~=1 && kg==1)
                         arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));                     
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur2(1,1),temp,next2(1,1)],[cur2(2,1),cur2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur1(1,1),next1(1,1),temp],[cur1(2,1),cur1(2,1),next1(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                       storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                     elseif(hk==1 && gk==1)
                         if(abs(cur2(1,1)-temp)>abs(cur1(1,1)-temp))
                         arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur2(1,1),next2(1,1)],[cur2(2,1),cur2(2,1),next2(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([temp,cur1(1,1),next1(1,1)],[cur1(2,1),cur1(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         else
                             arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur1(1,1),next1(1,1)],[cur1(2,1),cur1(2,1),next1(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),next2(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         end
                     elseif(hk==1 && gk~=1)
                        if(fix(next2(1,1))==fix(next1(1,1)))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor(cur1(1,1))+interval;
                            arry1(p)=fix(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        elseif(fix(next2(1,1))==next2(1,1))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        elseif(fix(next1(1,1))~= fix(next2(1,1)))
                            
                        tempo3=bet(next1(1,1),next2(1,1));
                            
                            temp3=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),temp1(1,1),cur2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),temp1(1,1),cur2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+2*interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                           if(fix(next1(1,1))==fix(next2(1,1)))
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                        p=p+1;
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                           elseif(fix(next1(1,1))==next1(1,1))
%                                 storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                                arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                                arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                                arrx1(p)=floor((cur2(1,1)))+interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p);    
                            p=p+1;
                           elseif(fix(next1(1,1))~= fix(next2(1,1)))
                            
                        tempo3=bet(next1(1,1),next2(1,1));
                            
                            temp3=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])+polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)]);
                           arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            
                                                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor((cur2(1,1)))+interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                                    p=p+1;
                            arrx1(p)=floor((cur2(1,1)))+2*interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                            
                     end
                     end
                   
        else
           
                    temp1=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);temp]);
                    temp2=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);temp]);
                    hk=0;gk=0;

                    if(inbet(i,i+interval,temp1(2,1))==1)
                        hk=1;
                    end
                    if(inbet(i,i+interval,temp2(2,1))==1)
                        gk=1;
                    end
                     if(hk~=1 && gk~=1)
%                       storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur1(2,1),temp,temp,next1(2,1)])+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),temp,temp,next2(2,1)]);
%                     elseif(hk==1 && gk==1)
%                         storearea=storearea+polyarea([cur1(1,1),temp1(1,1),temp2(1,1),cur2(1,1)],[cur2(2,1),temp1(2,1),temp2(2,1),cur2(2,1)])+polyarea([temp2(1,1),next2(1,1),next1(1,1),temp1(1,1)],[temp2(2,1),next2(2,1),next1(2,1),temp1(2,1)]);
                        arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));                     
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur1(1,1),temp,temp,next1(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                        p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([cur2(1,1),temp,temp,next2(1,1)],[cur2(2,1),cur2(2,1),next2(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                       storearea1=storearea1+arr(p)+arr(p-1);
                       p=p+1;
                     elseif(hk==1 && gk==1)
                         if(abs(cur2(1,1)-temp)>abs(cur1(1,1)-temp))
                         arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur2(1,1),next2(1,1)],[cur2(2,1),cur2(2,1),next2(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([temp,cur1(1,1),next1(1,1)],[cur1(2,1),cur1(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         else
                             arrx1(p)=floor(cur1(1,1))+interval;
                       arry1(p)=fix(cur1(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                       arr(p)=polyarea([temp,cur1(1,1),next1(1,1)],[cur1(2,1),cur1(2,1),next1(2,1)])*g(xoo,yoo);
                       p=p+1;
                       arrx1(p)=floor(cur2(1,1))+interval;
                       arry1(p)=fix(cur2(2,1));
                       [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                        arr(p)=polyarea([cur2(1,1),next2(1,1),next1(1,1)],[cur2(2,1),next2(2,1),next1(2,1)])*g(xoo,yoo);
                        storearea1=storearea1+arr(p)+arr(p-1);
                        p=p+1;
                         end
                     elseif(hk==1 && gk~=1)
                        if(fix(next2(1,1))==fix(next1(1,1)))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor(cur1(1,1))+interval;
                            arry1(p)=fix(cur1(2,1));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        elseif(fix(next2(1,1))==next2(1,1))
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),cur1(1,1),cur2(1,1),next2(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                        elseif(fix(next1(1,1))~= fix(next2(1,1)))
                            
                        tempo3=bet(next1(1,1),next2(1,1));
                            
                            temp3=linsolve([Aeqn2(1:2);[1 0]],[Aeqn2(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])+polyarea([temp1(1,1),temp1(1,1),cur2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])+polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur1(1,1),cur1(1,1),temp1(1,1)],[cur1(2,1),temp1(2,1),temp1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp1(1,1),temp1(1,1),cur2(1,1),temp3(1,1),temp3(1,1),next1(1,1)],[temp1(2,1),temp1(2,1),cur2(2,1),temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));
                            p=p+1;
                            arrx1(p)=floor((cur1(1,1)))+2*interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp3(1,1),next2(1,1),next2(1,1)],[temp3(2,1),temp3(2,1),next2(2,1)]);
                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                        end
                    elseif(gk==1 && hk~=1)
                           if(fix(next1(1,1))==fix(next2(1,1)))
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                            arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                        p=p+1;
                            arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p)+arr(p-1);
                            p=p+1;
                           elseif(fix(next1(1,1))==next2(1,1))
%                                 storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)]);
                                arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                                arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                                arrx1(p)=floor((cur2(1,1)))+interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                            arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),next1(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                            storearea1=storearea1+arr(p);    
                            p=p+1;
                           elseif(fix(next1(1,1))~= fix(next2(1,1)))
                            
                        tempo3=bet(next1(1,1),next2(1,1));
                            
                            temp3=linsolve([Aeqn1(1:2);[1 0]],[Aeqn1(3);tempo3]);
%                             storearea1=storearea1+polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])+polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])+polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)]);
                           arrx1(p)=floor((cur2(1,1)));
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                            
                                                        arr(p)=polyarea([cur2(1,1),cur2(1,1),temp2(1,1)],[cur2(2,1),temp2(2,1),temp2(2,1)])*g(fix(xoo),fix(yoo));
                                p=p+1;
                            arrx1(p)=floor((cur2(1,1)))+interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp2(1,1),cur2(1,1),cur1(1,1),temp3(1,1),next1(1,1),next2(1,1)],[temp2(2,1),temp2(2,1),cur1(2,1),temp3(2,1),temp3(2,1),next2(2,1)])*g(fix(xoo),fix(yoo));
                                    p=p+1;
                            arrx1(p)=floor((cur2(1,1)))+2*interval;
                            arry1(p)=fix((cur2(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                        arr(p)=polyarea([temp3(1,1),next1(1,1),next1(1,1)],[temp3(2,1),temp3(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p)+arr(p-1)+arr(p-2);
                            p=p+1;
                           
                           else
%                              storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                         arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p);
                             p=p+1;
                           end
else
%                              storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                            arrx1(p)=floor((cur1(1,1)))+interval;
                            arry1(p)=fix((cur1(2,1)));
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                         arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                            storearea1=storearea1+arr(p);
                             p=p+1;
                               
                     end
                    end       
        else
             storearea1=storearea1+polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)]);
                                    arrx1(p)=floor((cur1(1,1)));
                            arry1(p)=fix((cur1(2,1)));           
                            [xoo,yoo]=pix(arrx1(p),arry1(p),flag,interval);
                                                                arr(p)=polyarea([cur1(1,1),cur2(1,1),next2(1,1),next2(1,1)],[cur1(2,1),cur2(2,1),next2(2,1),next1(2,1)])*g(fix(xoo),fix(yoo));

                                    p=p+1;
        end       
        end
                    
    end
    if(ch==1)
        arr(p)=Tarr;
        arrx1(p)=Tarrx1;
        arry1(p)=Tarry1;
%         storearea1=storearea1+Tarr;
    end
    end
end

       
        
% else
%     ep=ending(2,2);
% end
