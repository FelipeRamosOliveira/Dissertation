%%  VERSÃO 30.08.2019
%   Autor:Felipe R. Oliveira
    clc; clear all; close all;
    global Lf t l_log E fy L MaxAva cont
%%  I.CHAMAR TODAS AS PASTAS NECESSÁRIAS
%   1.PASTAS PRINCIPAIS
    wpath=what;
    currentlocation=wpath.path;
    addpath([currentlocation]);
    addpath([currentlocation,'\PASTAS']);
    addpath([currentlocation,'\PASTAS\FAIXAS FINITAS']);
    addpath([currentlocation,'\PASTAS\GENERATIVO']);
    addpath([currentlocation,'\PASTAS\RESISTENCIA']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR']);
    addpath([currentlocation,'\PASTAS\POS-PROCESSAMENTO']);
%   2.OTIMIZADORES
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\AG']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\PSO']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\DE']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\ABC']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\LSHADE']);
    addpath([currentlocation,'\PASTAS\OTIMIZADOR\VARIANTES']);
    clc
    cont=0;
%%   II.GERAÇÃO ALEATÓRIA DE PERFIS
    N=1000;
    for K=1:N        
    disp(['Total de Perfis: ' num2str(N) ' - Perfil Atual: ' num2str(K)])    
%   MODO NORMAL GERADOR ALETÓRIO
    [Lf,t,L,l_log,E,fy,DimSFIA]=PFFAle;
            
%   PERFIL DE REFERÊNCIA SFIA 
   tic ,cont=cont+1; 
   [GustavoSFIA,LambdaLSFIA,LambdaDSFIA,LambdaGSFIA,NormaSFIA]=cPFF(DimSFIA); 
   Tempo=toc;
   Resultados(K,:)=[ E fy L Lf t NormaSFIA DimSFIA LambdaLSFIA LambdaDSFIA LambdaGSFIA NormaSFIA GustavoSFIA cont  Tempo];

%  RESULTADOS DA RODADA
   save('RESULTADOS',   'Resultados')
   disp(['-------------------------------------------------------------------']) 
    end 
%%  III.ARQUIVO DE SAÍDA  (.csv)
%
   Algor=8;
   Tabelas (Resultados,Algor)