function txt_PSO(titulo,Pcr,Dim,bw,TempoT,TempoR,Nint,Npop,Nrod)
global Nl Nd Ncre Ncrl Ncrd
Titulo=[titulo,...
        '_it_',num2str(Nint),'_part_',num2str(Npop),'_rod_',num2str(Nrod)......
        ,'.txt'];  
fid = fopen(Titulo,'wt');
igual='=';
%
fprintf(fid,'%s\n','____________________________________________________________');
fprintf(fid,'%s\n','ARQUIVO DE SAÌDA DO PSO                                     ');
fprintf(fid,'%s\n','____________________________________________________________');
%
%
fprintf(fid,'%s\n','Informações Gerais                                          ');
fprintf(fid,'%s\n','   ');
fprintf(fid,'Total de Interações%s %0.2f\n',                 igual,Nint*Npop*Nrod);
fprintf(fid,'Tempo Total%s %0.2f\n',                                 igual,TempoT);
fprintf(fid,'Tempo por Iteração%s %0.2f\n',                          igual,TempoR);
for kk=1:Nrod
fprintf(fid,'Largura Utlizada%s %0.2f\n',         igual,2*Dim(kk,1)+2*Dim(kk,2)+bw);
end
%
%
fprintf(fid,'%s\n','____________________________________________________________');
fprintf(fid,'%s\n','Dimensões Otimizadas		                                ');
fprintf(fid,'%s\n','   ');
fprintf(fid,'%s\n','    bw      bf    Theta   r     D                          ');
for ii=1:Nrod     
fprintf(fid,'\n | %.2f  %.2f  %.2f  %.2f  %.2f |\n',bw,Dim(ii,1),3,Dim(ii,2));
end
%
%
fprintf(fid,'%s\n','____________________________________________________________');
fprintf(fid,'%s\n','Força crítica de flambagem (kN)		                        ');
for jj=1:Nrod     
fprintf(fid,'\n | %.2f|\n',Pcr(jj,1));
end
%
%
fprintf(fid,'%s\n','____________________________________________________________');
fprintf(fid,'%s\n','Outras informações');
fprintf(fid,'%s\n','   ');
fprintf(fid,'%s\n','    Ncre       Ncrl        Ncrd'                            );
fprintf(fid,'\n  | %.2f     %.2f       %.2f |\n                 ',Ncre,Ncrl,Ncrd);
fprintf(fid,'\n   Nl = %.2f',Nl);
fprintf(fid,'\n   Nd = %.2f',Nd);
fprintf(fid,'\n   Razão Nl/Nd = %.2f',Nl/Nd);

fclose(fid);

end