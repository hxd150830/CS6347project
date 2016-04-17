function Mfinal=change_labels(MM)
M1= MM(:,1:25);
C1= MM(:,26);
C2=C1;
C2(C2==0)=2;
Mfinal= [M1, C2]; 
end 