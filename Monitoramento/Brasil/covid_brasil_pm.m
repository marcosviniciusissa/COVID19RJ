%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                           covid19rj.org                               %
%                                                                       %
%                      - COVID-19 NO BRASIL -                           %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 no Brasil. Será gerado uma série de gráficos com os estados  %
% de cada região e de todo Brasil.                                      %
%                                                                       %
% A série contém:                                                       %
% - número de casos por milhão em relação ao tempo desde 10 casos por   %
% milhão;                                                               %
% - número de mortes por milhão em relação ao tempo desde 1 morte por   %
% milhão;                                                               %
% - número de novos casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de novas mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
%                                                                       %
% Você precisará do arquivo "arquivo_geral" encontrado no site do       %
% Ministério da Saúde:                                                  %
% https://covid.saude.gov.br/                                           %
%                                                                       %
%                                                                       %
%                             Malú Grave                                %
%                         malugravemg@gmail.com                         %
%                        malugrave@nacad.ufjr.br                        %
%                                                                       %
%         [x] Working                                                   %
% Status: [ ] Not working                                               %
%         [ ] Experimental                                              %
%                                                                       %
% Last Update [05/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%

clc;
clear all;
close all;

% IMPORTANTE
% Esse código só funciona se o Ministério da Saúde manter o padrão de formatação dos arquivos.
% O padrão é:
% - Conter headers com os nomes: "estado","data","casosNovos","casosAcumulados", "obitosNovos", "obitosAcumulados".

%Lendo o arquivo disponível no site 
data = readtable('arquivo_geral.csv');
BRASIL = [data.casosAcumulados, data.casosNovos, data.obitosAcumulados, data.obitosNovos];

%Definindo o número de dias com informações do COVID-19, que representa o tamanho das matrizes dos estados
[n1,n2] = size(BRASIL);
D = n1/27;
dia = data.data;
[n1dia,n2dia] = size(dia);
end_time = datestr(dia(n1dia,n2dia),24);


%Separando os dados em 27 sub-matrizes
RO= BRASIL(find(strcmp([data.estado], 'RO')),:);
AC= BRASIL(find(strcmp([data.estado], 'AC')),:);
AM= BRASIL(find(strcmp([data.estado], 'AM')),:);
RR= BRASIL(find(strcmp([data.estado], 'RR')),:);
PA= BRASIL(find(strcmp([data.estado], 'PA')),:);
AP= BRASIL(find(strcmp([data.estado], 'AP')),:);
TO= BRASIL(find(strcmp([data.estado], 'TO')),:);
MA= BRASIL(find(strcmp([data.estado], 'MA')),:);
PI= BRASIL(find(strcmp([data.estado], 'PI')),:);
CE= BRASIL(find(strcmp([data.estado], 'CE')),:);
RN= BRASIL(find(strcmp([data.estado], 'RN')),:);
PB= BRASIL(find(strcmp([data.estado], 'PB')),:);
PE= BRASIL(find(strcmp([data.estado], 'PE')),:);
AL= BRASIL(find(strcmp([data.estado], 'AL')),:);
SE= BRASIL(find(strcmp([data.estado], 'SE')),:);
BA= BRASIL(find(strcmp([data.estado], 'BA')),:);
MG= BRASIL(find(strcmp([data.estado], 'MG')),:);
ES= BRASIL(find(strcmp([data.estado], 'ES')),:);
RJ= BRASIL(find(strcmp([data.estado], 'RJ')),:);
SP= BRASIL(find(strcmp([data.estado], 'SP')),:);
PR= BRASIL(find(strcmp([data.estado], 'PR')),:);
SC= BRASIL(find(strcmp([data.estado], 'SC')),:);
RS= BRASIL(find(strcmp([data.estado], 'RS')),:);
MS= BRASIL(find(strcmp([data.estado], 'MS')),:);
MT= BRASIL(find(strcmp([data.estado], 'MT')),:);
GO= BRASIL(find(strcmp([data.estado], 'GO')),:);
DF= BRASIL(find(strcmp([data.estado], 'DF')),:);


BR=RO+AC+AM+RR+PA+AP+TO+MA+PI+CE+RN+PE+AL+SE+BA+MG+ES+RJ+SP+PR+SC+RS+MS+MT+DF+PB+GO

%População de cada estado (fonte wikipedia)
popRO=1777225;
popAC=881935;
popAM=4144597;
popRR=605761;
popPA=8602865;
popAP=845731;
popTO=1572866;
popMA=7075181;
popPI=3273227;
popCE=9132078;
popRN=3506853;
popPB=4018127;
popPE=9557071;
popAL=3337357;
popSE=2298696;
popBA=14873064;
popMG=21168791;
popES=4018650;
popRJ=17264943;
popSP=45919049;
popPR=11433957;
popSC=7164788;
popRS=11377239;
popMS=2778986;
popMT=3484466;
popGO=7018354;
popDF=3015268;

popBR=popRO+popAC+popAM+popRR+popPA+popAP+popTO+popMA+popPI+popCE+popRN+popPE+popAL+popSE+popBA+popMG+popES+popRJ+popSP+popPR+popSC+popRS+popMS+popMT+popDF+popPB+popGO

dates = data.data(find(strcmp([data.estado],'RO')),:);
end_time = max(datenum(dates));

%inicio do loop de plot
for (regions = 1:1:6)
if (regions == 1 )
begin_states = 0;
end_states = 7;
name = 'Norte'
end
if (regions == 2 )
begin_states = 0;
end_states = 9;
name = 'Nordeste'
end
if (regions == 3 )
begin_states = 0;
end_states = 4;
name = 'Centro-Oeste'
end
if (regions == 4 )
begin_states = 0;
end_states = 4;
name = 'Sudeste'
end
if (regions == 5 )
begin_states = 0;
end_states = 3;
name = 'Sul'
end
if (regions == 6 )
begin_states = 0;
end_states = 27;
name = 'Brasil'
end

for( plot_type = 1:1:2)

%loop nos 13 países estudados
for( init = end_states:-1:begin_states)

clearvars -except plot_type init BRASIL data name end_time regions begin_states end_states popBR BR dates

if (plot_type == 1)

if (regions == 1)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 3) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 5) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 7) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 6) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 1) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 4) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 2) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
end

if (regions == 2)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 6) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 9) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 7) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 5) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 8) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 2) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 3) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 1) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
end

if (regions == 3)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 3) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 4) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 2) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 1) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
end

if (regions == 4)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 2) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 1) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 3) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 4) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
end

if (regions == 5)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 3) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 2) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 1) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (regions == 6)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 2) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 3) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 4) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 5) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 6) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 7) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
if (init == 8) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 9) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 10) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 11) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 12) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 13) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 14) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 15) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 16) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
if (init == 17) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 18) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 19) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 20) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
if (init == 21) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 22) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 23) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 24) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
if (init == 25) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 26) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 27) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end


end

if (plot_type == 2)

if (regions == 1)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 5) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 7) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 6) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 1) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 3) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 2) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
end

if (regions == 2)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 5) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 6) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 9) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 7) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 4) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 8) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 1) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 3) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 2) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
end

if (regions == 3)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 4) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 3) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 2) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 1) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
end


if (regions == 4)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 2) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 1) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 3) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 4) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
end

if (regions == 5)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 2) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 3) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end

if (regions == 6)
if (init == 0) country = 'BR'; color = [0,0,0]/255; pop = popBR; end
if (init == 1) country = 'AC'; color = [69,169,0]/255; pop = 881935; end
if (init == 2) country = 'AP'; color = [5,163,29]/255; pop = 845731; end
if (init == 3) country = 'AM'; color = [53,143,31]/255; pop = 4144597; end  
if (init == 4) country = 'PA'; color = [0,169,74]/255; pop = 8602865; end
if (init == 5) country = 'TO'; color = [0,109,22]/255; pop = 1572866; end
if (init == 6) country = 'RO'; color = [0,104,44]/255; pop = 1777225; end
if (init == 7) country = 'RR'; color = [0,67,21]/255; pop = 605761; end
if (init == 8) country = 'AL'; color = [96,209,224]/255; pop = 3337357; end
if (init == 9) country = 'BA'; color = [0,170,196]/255; pop = 14873064; end
if (init == 10) country = 'CE'; color = [0,116,136]/255; pop = 9132078; end
if (init == 11) country = 'MA'; color = [0,74,84]/255; pop = 7075181; end
if (init == 12) country = 'PB'; color = [27,78,142]/255; pop = 4018127; end
if (init == 13) country = 'PE'; color = [0,99,181]/255; pop = 9557071; end
if (init == 14) country = 'PI'; color = [0,45,135]/255; pop = 3273227; end
if (init == 15) country = 'RN'; color = [0,34,80]/255; pop = 3506853; end
if (init == 16) country = 'SE'; color = [0,20,37]/255; pop = 2298696; end
if (init == 17) country = 'DF'; color = [181,147,87]/255; pop = 3015268; end
if (init == 18) country = 'GO'; color = [135,85,30]/255; pop = 7018354; end
if (init == 19) country = 'MT'; color = [110,71,28]/255; pop = 3484466; end
if (init == 20) country = 'MS'; color = [86,62,32]/255; pop = 2778986; end
if (init == 21) country = 'ES'; color = [255,130,113]/255; pop = 4018650; end
if (init == 22) country = 'MG'; color = [254,88,52]/255; pop = 21168791; end
if (init == 23) country = 'RJ'; color = [248,66,9]/255; pop = 17264943; end
if (init == 24) country = 'SP'; color = [203,63,23]/255; pop = 45919049; end
if (init == 25) country = 'PR'; color = [209,227,105]/255; pop = 11433957; end
if (init == 26) country = 'RS'; color = [193,203,68]/255; pop = 11377239; end
if (init == 27) country = 'SC'; color = [191,171,72]/255; pop = 7164788; end
end


end


if (init > 0) location = BRASIL(find(strcmp([data.estado], country)),:); linew = 1.2; end
if (init == 0) location = BR; linew = 1.75; end




tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

tot_cases_pm = tot_cases/ (pop / 1000000);
new_cases_pm = new_cases/ (pop / 1000000);
tot_deaths_pm = tot_deaths/ (pop / 1000000);
new_deaths_pm = new_deaths/ (pop / 1000000);

%consolidando os novos casos e mortes por semana
new_cases7 = new_cases;
for (i=7:1:max(max(size(dates))) ) 
new_cases7(i,1) = new_cases(i,1)+new_cases(i-1,1)+new_cases(i-2,1)+new_cases(i-3,1)+new_cases(i-4,1)+new_cases(i-5,1)+new_cases(i-6,1);
new_deaths7(i,1) = new_deaths(i,1)+new_deaths(i-1,1)+new_deaths(i-2,1)+new_deaths(i-3,1)+new_deaths(i-4,1)+new_deaths(i-5,1)+new_deaths(i-6,1);
new_cases7_pm(i,1) = new_cases_pm(i,1)+new_cases_pm(i-1,1)+new_cases_pm(i-2,1)+new_cases_pm(i-3,1)+new_cases_pm(i-4,1)+new_cases_pm(i-5,1)+new_cases_pm(i-6,1);
new_deaths7_pm(i,1) = new_deaths_pm(i,1)+new_deaths_pm(i-1,1)+new_deaths_pm(i-2,1)+new_deaths_pm(i-3,1)+new_deaths_pm(i-4,1)+new_deaths_pm(i-5,1)+new_deaths_pm(i-6,1);
end

%Criando vetores desde dia zero a partir de X mortes/milhao ("_deaths") ou a partir de X casos/milhao ("_cases")
%Usuário define dia zero para casos ou mortes
X_deaths_pm = 1;
X_cases_pm = 10;
X_deaths = 100;
X_cases = 1000;

n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_deaths(i,1) >= X_deaths)
n=n+1;
tot_deaths_X(n,1) = tot_deaths(i,1);
new_deaths_X(n,1) = new_deaths(i,1);
new_deaths7_X(n,1) = new_deaths7(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases(i,1) >= X_cases)
n=n+1;
tot_cases_X(n,1) = tot_cases(i,1);
new_cases_X(n,1) = new_cases(i,1);
new_cases7_X(n,1) = new_cases7(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_cases_pm(i,1) >= X_cases_pm)
n=n+1;
tot_cases_pmX(n,1) = tot_cases_pm(i,1);
new_cases_pmX(n,1) = new_cases_pm(i,1);
new_cases7_pmX(n,1) = new_cases7_pm(i,1);
end
end
n=0;
for (i=1:1:max(max(size(dates))) )
if (tot_deaths_pm(i,1) >= X_deaths_pm)
n=n+1;
tot_deaths_pmX(n,1) = tot_deaths_pm(i,1);
new_deaths_pmX(n,1) = new_deaths_pm(i,1);
new_deaths7_pmX(n,1) = new_deaths7_pm(i,1);
end
end


%Fontes
fonte_titulo = 10;
fonte_labels = 9;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

day_axis = 70;


if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);
 n = max(max(size(tot_deaths_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_pmX,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_deaths_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas mortes X total de mortes (por milhao de hab.)
figure (3);
 n = max(max(size(tot_deaths_pm)));
 fig=loglog(tot_deaths_pm,new_deaths7_pm,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_deaths_pm(n,1), new_deaths7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (5);
 n = max(max(size(new_deaths_pmX)));
 days = 0:1:n-1;
 fig=plot(days,new_deaths7_pmX,'DisplayName',[country,' - ',num2str(max(tot_deaths)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_deaths7_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);
end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

 n = max(max(size(tot_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_pmX,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_cases_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos X total de casos (por milhao de hab.)
figure (4);
 n = max(max(size(tot_cases_pm)));
 fig=loglog(tot_cases_pm,new_cases7_pm,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_cases_pm(n,1), new_cases7_pm(n,1), [' ',country],'FontSize',fonte_location,"color",color);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novos casos/milhao por tempo (dia zero definido por casos/milhao)
figure (6);

 n = max(max(size(new_cases_pmX)));
 days = 0:1:n-1;
 fig=plot(days,new_cases7_pmX,'DisplayName',[country,' - ',num2str(max(tot_cases)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_cases7_pmX(n,1), [' ',country],'FontSize',fonte_location,"color",color);


end

end

end


% Configurações:

outputdir = datestr(end_time,29);
if ~exist(outputdir, 'dir')
  mkdir(outputdir);
end


figure(1)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Letalidade da epidemia (por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Letalidade da epidemia (por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
axis([0 [day_axis-10] 1 1000]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')


figure (2)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Contágio da epidemia (por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Contágio da epidemia (por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);

axis([0 day_axis 10 10000]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')



figure (3)

set(gca,'FontSize',fonte_padrao);
if (regions < 6)
title({'Informativo de progresso da epidemia (mortes por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Informativo de progresso da epidemia (mortes por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Novas mortes por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de mortes (por milhão de habitantes)",'FontSize',fonte_labels);
axis([1 1000 1 1000]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));
curtick = get(gca, 'XTick');
set(gca, 'XTickLabel', cellstr(num2str(curtick(:))));

% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

figure(4)

set(gca,'FontSize',fonte_padrao);
if (regions < 6)
title({'Informativo de progresso da epidemia (casos por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Informativo de progresso da epidemia (casos por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
ylabel(['Novos casos por semana (por milhão de habitantes)'],'FontSize',fonte_labels);
xlabel ("Total de casos (por milhão de habitantes)",'FontSize',fonte_labels);
axis([10 10000 10 10000]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);




curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));
curtick = get(gca, 'XTick');
set(gca, 'XTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[.12 -0.0], .24,.12,]);
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')


figure(5)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Letalidade semanal da epidemia (por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Letalidade semanal da epidemia (por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Novas mortes por semana (por milhão de habitantes)",'FontSize',fonte_labels);
axis([0 [day_axis-10] 0 120]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
if (regions == 1) ha2=axes('position',[haPos([3 1])-[.625 -0.35], .24,.12,]); end
if (regions == 2) ha2=axes('position',[haPos([3 1])-[.625 -0.30], .24,.12,]); end
if (regions == 3) ha2=axes('position',[haPos([3 1])-[.625 -0.47], .24,.12,]); end
if (regions == 4) ha2=axes('position',[haPos([3 1])-[.625 -0.47], .24,.12,]); end
if (regions == 5) ha2=axes('position',[haPos([3 1])-[.625 -0.49], .24,.12,]); end
if (regions == 6) ha2=axes('position',[haPos([3 1])-[.625 -0.65], .24,.12,]); end
% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')

figure (6)

set(gca,'FontSize',fonte_padrao)
if (regions < 6)
title({'Contágio semanal da epidemia (por milhão de habitantes)',['Estados da região ',name,'  em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend ("location", "northwest");
end
if (regions == 6)
title({'Contágio semanal da epidemia (por milhão de habitantes)',['Todos os estados do Brasil em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
legend = "off";
end
xlabel(['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos (por milhão de habitantes)'],'FontSize',fonte_labels);
ylabel ("Novos casos por semana (por milhão de habitantes)",'FontSize',fonte_labels);
axis([0 day_axis 0 2000]);
Pos = [250,250,600,450];
set(0, 'DefaultFigurePosition', Pos);

curtick = get(gca, 'YTick');
set(gca, 'YTickLabel', cellstr(num2str(curtick(:))));


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
if (regions == 1) ha2=axes('position',[haPos([3 1])-[.625 -0.35], .24,.12,]); end
if (regions == 2) ha2=axes('position',[haPos([3 1])-[.625 -0.30], .24,.12,]); end
if (regions == 3) ha2=axes('position',[haPos([3 1])-[.625 -0.47], .24,.12,]); end
if (regions == 4) ha2=axes('position',[haPos([3 1])-[.625 -0.47], .24,.12,]); end
if (regions == 5) ha2=axes('position',[haPos([3 1])-[.625 -0.49], .24,.12,]); end
if (regions == 6) ha2=axes('position',[haPos([3 1])-[.625 -0.65], .24,.12,]); end

% To place the logo at the bottom left corner of the figure window
% uncomment the line below and comment the above two lines
%ha2=axes('position',[0, 0, .1,.04,]);
% Adding a LOGO to the new axes
% The logo file(jpeg, png, etc.) must be placed in the working path
[x, map]=imread('logo.png');
image(x)
% Setting the colormap to the colormap of the imported logo image
colormap (map)
% Turn the handlevisibility off so that we don't inadvertently plot
% into the axes again. Also, make the axes invisible
set(ha2,'handlevisibility','off','visible','off')



saveas(figure(1),[pwd '/',outputdir,'/',name,'_letalidade-pm_',datestr(end_time,29),'.png']);
saveas(figure(2),[pwd '/',outputdir,'/',name,'_contagio-pm_',datestr(end_time,29),'.png']);
saveas(figure(3),[pwd '/',outputdir,'/',name,'_informativo-mortes-pm_',datestr(end_time,29),'.png']);
saveas(figure(4),[pwd '/',outputdir,'/',name,'_informativo-casos-pm_',datestr(end_time,29),'.png']);
saveas(figure(5),[pwd '/',outputdir,'/',name,'_letalidade-semanal-pm_',datestr(end_time,29),'.png']);
saveas(figure(6),[pwd '/',outputdir,'/',name,'_contagio_semanal-pm_',datestr(end_time,29),'.png']);

close all

end

