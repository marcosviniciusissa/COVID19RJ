%=======================================================================%
%                             COVID-19                                  %
%                      OBSERVATÓRIO FLUMINENSE                          %
%                         www.covid19rj.org                             %
%                                                                       %
%                  - COVID-19 EM DIVERSOS PAÍSES  -                     %
%                                                                       %
% Este algoritmo gera gráficos sobre os números de casos e mortes por   %
% Covid-19 nos países de interesse.                                     %
%                                                                       %
% A série de gráficos contém:                                           %
% - número de casos por milhão em relação ao tempo desde 100 casos por  %
% milhão;                                                               %
% - número de mortes por milhão em relação ao tempo desde 10 mortes por %
% milhão;                                                               %
% - número de Casos por semana em relação ao total de casos (por  %
% milhão de habitantes);                                                %
% - número de Mortes por semana em relação ao total de mortes     %
% (por milhão de habitantes).                                           %
%                                                                       %
% Você precisará do arquivo "owid-covid-data.csv" encontrados em        %
% https://ourworldindata.org/coronavirus-source-data                    %
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
% Last Update [11/05/2020]                                              %
%_______________________________________________________________________%
%=======================================================================%
clc;
clear all;
close all;

%nome que aparece nos arquivos
name = 'WD';

% fullURL = ['https://covid.ourworldindata.org/data/owid-covid-data.csv'];
% filename = 'owid-covid-data.csv';
% urlwrite(fullURL,[pwd '/Dados/',filename]);
% 
% fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
% filename = 'cases-brazil-states.txt';
% urlwrite(fullURL,[pwd '/Dados/',filename]);

%Lendo o arquivo disponível no site 
all_data = readtable([pwd,'/Dados/owid-covid-data.csv']);
data = [all_data.total_cases,all_data.new_cases,all_data.total_deaths,all_data.new_deaths,all_data.total_cases_per_million,all_data.new_cases_per_million,all_data.total_deaths_per_million,all_data.new_deaths_per_million];

%Lendo o arquivo do Brasil
popBR = 212.559409;
BR_all_data = readtable([pwd,'/Dados/cases-brazil-states.txt']);
BR_data = [BR_all_data.totalCases,BR_all_data.newCases,BR_all_data.deaths,BR_all_data.newDeaths,BR_all_data.totalCases/popBR,BR_all_data.newCases/popBR,BR_all_data.deaths/popBR,BR_all_data.newDeaths/popBR];


%plot_type é pra diferenciar mortes e casos pra organizarmos a ordem da legenda de acordo com o número de mortes ou de casos
for( plot_type = 1:1:2)
%loop nos 13 países estudados
for( init = 1:1:20)

clearvars -except plot_type init all_data data name BR_all_data BR_data

%espessura da linha no plot
linew = 1.25;



if (plot_type == 1)
%ordem por países que tem mais morte
if (init == 2) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 8) country = 'India'; color = [69,169,0]/255; end
if (init == 17) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 10) country = 'Peru'; color = [181,147,87]/255; end
if (init == 9) country = 'Iran'; color = [255,130,113]/255; end
if (init == 13) country = 'Germany'; color = [209,227,105]/255; end
if (init == 14) country = 'Chile'; color = [248,187,208]/255; end
if (init == 1) country = 'United States'; color = [0,104,44]/255; end
if (init == 6) country = 'France'; color = [0,45,135]/255; end
if (init == 3) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 5) country = 'Italy'; color = [203,63,23]/255; end
if (init == 7) country = 'Spain'; color = [191,171,72]/255; end
if (init == 12) country = 'Belgium'; color = [236,64,122]/255; end
if (init == 11) country = 'Russia'; color = [0.4,0.4,0.4]; end
if (init == 16) country = 'Sweden'; color = [0,0.5,0.6]; end
if (init == 19) country = 'China'; color = [185,205,140]/255; end
if (init == 4) country = 'Mexico'; color = [253, 250, 145]/255; end
if (init == 15) country = 'Colombia'; color = [221, 160, 221]/255; end
if (init == 18) country = 'South Africa'; color = [129, 165, 220]/255; end
if (init == 20) country = 'Saudi Arabia'; color = [255, 228, 181]/255; end

if strcmp(country, 'Brazil')
    location = BR_data(find(strcmp([BR_all_data.state], 'TOTAL')),1:8);
    dates = BR_all_data.date(find(strcmp([BR_all_data.state],'TOTAL')),:);
end_time = max(datenum(dates));
else
    location = data(find(strcmp([all_data.location], country)),1:8);
    dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;
end

if strcmp(country, 'United States') country_leg = 'EUA            '; end 
if strcmp(country, 'United Kingdom') country_leg = 'Reino Unido '; end
if strcmp(country, 'Belgium') country_leg = 'Bélgica          '; end 
if strcmp(country, 'Brazil') country_leg = 'Brasil           '; end 
if strcmp(country, 'Iran') country_leg = 'Irã                '; end 
if strcmp(country, 'Peru') country_leg = 'Peru             '; end 
if strcmp(country, 'Turkey') country_leg = 'Turquia          '; end 
if strcmp(country, 'India') country_leg = 'Índia            '; end 
if strcmp(country, 'Chile') country_leg = 'Chile              '; end 
if strcmp(country, 'France') country_leg = 'França         '; end 
if strcmp(country, 'Spain') country_leg = 'Espanha      '; end 
if strcmp(country, 'Italy') country_leg = 'Itália            '; end 
if strcmp(country, 'Germany') country_leg = 'Alemanha      '; end 
if strcmp(country, 'Russia') country_leg = 'Rússia          '; end 
if strcmp(country, 'Sweden') country_leg = 'Suécia            '; end 
if strcmp(country, 'China') country_leg = 'China             '; end 
if strcmp(country, 'Mexico') country_leg = 'México         '; end 
if strcmp(country, 'Saudi Arabia') country_leg = 'Arábia Saudita'; end 
if strcmp(country, 'South Africa') country_leg = 'África do Sul  '; end 
if strcmp(country, 'Colombia') country_leg = 'Colômbia       '; end 
end

if (plot_type == 2)
%ordem por países que tem mais caso
if (init == 2) country = 'Brazil'; color = [0,0,0]/255; linew = 1.75; end
if (init == 3) country = 'India'; color = [69,169,0]/255; end
if (init == 14) country = 'Turkey'; color = [96,209,224]/255; end  
if (init == 6) country = 'Peru'; color = [181,147,87]/255; end
if (init == 10) country = 'Iran'; color = [255,130,113]/255; end
if (init == 15) country = 'Germany'; color = [209,227,105]/255; end
if (init == 8) country = 'Chile'; color = [248,187,208]/255; end
if (init == 1) country = 'United States'; color = [0,104,44]/255; end
if (init == 17) country = 'France'; color = [0,45,135]/255; end
if (init == 9) country = 'United Kingdom'; color = [135,85,30]/255; end
if (init == 13) country = 'Italy'; color = [203,63,23]/255; end
if (init == 11) country = 'Spain'; color = [191,171,72]/255; end
if (init == 20) country = 'Belgium'; color = [236,64,122]/255; end
if (init == 4) country = 'Russia'; color = [0.4,0.4,0.4]; end
if (init == 19) country = 'Sweden'; color = [0,0.5,0.6]; end
if (init == 18) country = 'China'; color = [185,205,140]/255; end
if (init == 7) country = 'Mexico'; color = [253, 250, 145]/255; end
if (init == 16) country = 'Colombia'; color = [221, 160, 221]/255; end
if (init == 5) country = 'South Africa'; color = [129, 165, 220]/255; end
if (init == 12) country = 'Saudi Arabia'; color = [255, 228, 181]/255; end

if strcmp(country, 'Brazil')
    location = BR_data(find(strcmp([BR_all_data.state], 'TOTAL')),1:8);
    dates = BR_all_data.date(find(strcmp([BR_all_data.state],'TOTAL')),:);
end_time = max(datenum(dates));
else
    location = data(find(strcmp([all_data.location], country)),1:8);
    dates = all_data.date(find(strcmp([all_data.location],country)),:);
end_time = max(datenum(dates))-1;
end



if strcmp(country, 'United States') country_leg = 'EUA              '; end 
if strcmp(country, 'United Kingdom') country_leg = 'Reino Unido    '; end
if strcmp(country, 'Belgium') country_leg = 'Bélgica              '; end 
if strcmp(country, 'Brazil') country_leg = 'Brasil            '; end 
if strcmp(country, 'Iran') country_leg = 'Irã                   '; end 
if strcmp(country, 'Peru') country_leg = 'Peru                '; end 
if strcmp(country, 'Turkey') country_leg = 'Turquia           '; end 
if strcmp(country, 'India') country_leg = 'Índia              '; end 
if strcmp(country, 'Chile') country_leg = 'Chile               '; end 
if strcmp(country, 'France') country_leg = 'França             '; end 
if strcmp(country, 'Spain') country_leg = 'Espanha         '; end 
if strcmp(country, 'Italy') country_leg = 'Itália               '; end 
if strcmp(country, 'Germany') country_leg = 'Alemanha       '; end 
if strcmp(country, 'Russia') country_leg = 'Rússia             '; end 
if strcmp(country, 'Sweden') country_leg = 'Suécia               '; end 
if strcmp(country, 'China') country_leg = 'China                '; end 
if strcmp(country, 'Mexico') country_leg = 'México            '; end 
if strcmp(country, 'Saudi Arabia') country_leg = 'Arábia Saudita'; end 
if strcmp(country, 'South Africa') country_leg = 'África do Sul   '; end 
if strcmp(country, 'Colombia') country_leg = 'Colômbia         '; end 
end




tot_cases = location(:,1);
new_cases = location(:,2);
tot_deaths = location(:,3);
new_deaths = location(:,4);

tot_cases_pm = location(:,5);
new_cases_pm = location(:,6);
tot_deaths_pm = location(:,7);
new_deaths_pm = location(:,8);

tot_cases(isnan(tot_cases))=0;
new_cases(isnan(new_cases))=0;
tot_deaths(isnan(tot_deaths))=0;
new_deaths(isnan(new_deaths))=0;

tot_cases_pm(isnan(tot_cases_pm))=0;
new_cases_pm(isnan(new_cases_pm))=0;
tot_deaths_pm(isnan(tot_deaths_pm))=0;
new_deaths_pm(isnan(new_deaths_pm))=0;

%consolidando os Casos e mortes por semana
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
fonte_titulo = 10.5;
fonte_labels = 10;
fonte_padrao = 9; %numeros dos eixos
fonte_location = 8;

day_axis = 200;

Pos = [0,250,900,450];
set(0, 'DefaultFigurePosition', Pos);

if (plot_type == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (1);

grid1=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=1;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(tot_deaths_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_deaths_pmX,'DisplayName',[country_leg,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_deaths_pmX(n,1), [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');

tot_mortes(init,1) = max(tot_deaths);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Mortes X total de mortes (por milhao de hab.)
figure (3);

grid1=loglog([1,10000],10*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,10000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid3=loglog(10*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(100*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(1000*(ones(2, 1)),[1,1000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Mortes
 new_deaths7w0_pm = new_deaths7_pm;
 tot_deathsw0_pm = tot_deaths_pm;
 pos0 = new_deaths7_pm(:,1) <= 0;
 tot_deathsw0_pm(pos0,:) = [];
 new_deaths7w0_pm(pos0,:) = [];

 
 n = max(max(size(tot_deathsw0_pm)));
%  if strcmp(country, 'China') new_deaths7w0_pm = zeros(n,1); end
  fig=loglog(tot_deathsw0_pm,new_deaths7w0_pm,'DisplayName',[country_leg,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_deathsw0_pm(n,1), new_deaths7w0_pm(n,1), [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar novas de mortes/milhao por tempo (dia zero definido por mortes/milhao)
figure (5);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),0.1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
% y_init=1;
% for (i=0:1:day_axis-1)
% y(i+1) = y_init*2^i;
% x1(i+1) = 4*i;
% x2(i+1) = 5*i;
% x3(i+1) = 6*i;
% x4(i+1) = 7*i;
% end
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(new_deaths7_pmX)));
%  if strcmp(country, 'China') new_deaths7_pmX = zeros(n,1); end
 days = 0:1:n-1;
 fig=semilogy(days,new_deaths7_pmX/7,'DisplayName',[country_leg,'  ',num2str(tot_deaths(max(size(tot_deaths)),1)),' mortes'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_deaths7_pmX(n,1)/7, [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');

end

if (plot_type == 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar total de casos/milhao por tempo (dia zero definido por casos/milhao)
figure (2);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),10000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

%Linhas "dobram"
y_init=10;
for (i=0:1:day_axis-1)
y(i+1) = y_init*2^i;
x1(i+1) = 4*i;
x2(i+1) = 5*i;
x3(i+1) = 6*i;
x4(i+1) = 7*i;
end
dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;
dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
hold on;

 n = max(max(size(tot_cases_pmX)));
 days = 0:1:n-1;
 fig=semilogy(days,tot_cases_pmX,'DisplayName',[country_leg,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, tot_cases_pmX(n,1), [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plotar Casos X total de casos (por milhao de hab.)
figure (4);

grid1=loglog([1,100000],100*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=loglog([1,100000],1000*(ones(2, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

grid3=loglog(100*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=loglog(1000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid5=loglog(10000*(ones(2, 1)),[1,10000],'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

 %Tirando os zeros de Casos
 new_cases7w0_pm = new_cases7_pm;
 tot_casesw0_pm = tot_cases_pm;
  pos0 = new_cases7_pm(:,1) <= 0;
 tot_casesw0_pm(pos0,:) = [];
 new_cases7w0_pm(pos0,:) = [];
 
 n = max(max(size(tot_casesw0_pm)));
 %if strcmp(country, 'China') new_cases7w0_pm = zeros(n,1); end
 fig=loglog(tot_casesw0_pm,new_cases7w0_pm,'DisplayName',[country_leg,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (tot_casesw0_pm(n,1), new_cases7w0_pm(n,1), [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%o
%Plotar Casos/milhao por tempo (dia zero definido por casos/milhao)
figure (6);

%Grid manual
grid1=semilogy(0:1:(day_axis-1),1*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid2=semilogy(0:1:(day_axis-1),10*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid3=semilogy(0:1:(day_axis-1),100*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;
grid4=semilogy(0:1:(day_axis-1),1000*(ones(day_axis, 1)),'color',[0.8,0.8,0.8],'HandleVisibility','off');
hold on;

% %Linhas "dobram"
% y_init=10;
% for (i=0:1:day_axis-1)
% y(i+1) = y_init*2^i;
% x1(i+1) = 4*i;
% x2(i+1) = 5*i;
% x3(i+1) = 6*i;
% x4(i+1) = 7*i;
% end
% dobram1=semilogy(x1,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram2=semilogy(x2,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram3=semilogy(x3,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;
% dobram4=semilogy(x4,y,'color',[0.4,0.4,0.4],'LineStyle','--','HandleVisibility','off');
% hold on;

 n = max(max(size(new_cases_pmX)));
 %if strcmp(country, 'China') new_cases7_pmX = zeros(n,1); end
 days = 0:1:n-1;
 fig=semilogy(days,new_cases7_pmX/7,'DisplayName',[country_leg,'  ',num2str(tot_cases(max(size(tot_cases)),1)),' casos'],"color",color,'LineWidth', linew);
 hold on;
 text (n-1, new_cases7_pmX(n,1)/7, [' ',country_leg],'FontSize',fonte_location,"color",color,"Clipping",'on');


end

end

end


% Configurações:
figure(1)

set(gca,'FontSize',fonte_padrao)
title({'Mortalidade da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],['(por milhão de habitantes)']},'FontSize',fonte_labels);
ylabel ({'Total de mortes', '(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=1;
max_y=10000;
ang = 68;
h1=text(50.5,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 66;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 59;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 57;
h4=text(90,0.9*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'1','10','100','1k','10k'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);


axis([0 day_axis y_init max_y]);
Pos = [250,250,600,450];




% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);

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
title({'Contágio da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'], '(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Total de casos','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=10;
max_y=100000;
ang = 68;
h1=text(50.5,0.9*max_y,'números dobram a cada 4 dias');
set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 66;
h2=text(64,0.9*max_y,'5 dias');
set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 59;
h3=text(76.9,0.9*max_y,'6 dias');
set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
ang = 57;
h4=text(90,0.9*max_y,'7 dias');
set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'10','100','1k','10k','100k'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);
Pos = [250,250,600,450];


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de mortes)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo)
ylabel({'Mortes por semana','(por milhão de habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de mortes','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 10000;
max_y = 1000;
axis([1 max_x 1 max_y]);

set(gca,'YTickLabel',{'1','10','100','1k'})
set(gca,'XTickLabel',{'1','10','100','1k','10k'})


hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://ourworldindata.org/coronavirus-source-data'});
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% dim = [0.705 0.035 0.8 0.2];
% str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);



% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);
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
title({'Informativo de progresso da epidemia (número de casos)',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
ylabel({'Casos por semana','(por milhão de habitantes)'},'FontSize',fonte_labels);
xlabel ({'Total de casos','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
max_x = 100000;
max_y = 10000;
axis([10 max_x 10 max_y]);


set(gca,'YTickLabel',{'10','100','1k','10k'})
set(gca,'XTickLabel',{'10','100','1k','10k','100k'})

hfonte=text(max_x,max_y,{'Gráfico inspirado em: https://aatishb.com/covidtrends/','Fonte: https://ourworldindata.org/coronavirus-source-data'});
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

% dim = [0.705 0.035 0.8 0.2];
% str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);



% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);
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
title({'Mortalidade diária da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_deaths_pm),' morte'],'(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Mortes diárias','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");

y_init=0.01;
max_y=100;
% ang = 57;
% h1=text(37.2,0.8*max_y,'números dobram a cada 4 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 52;
% h2=text(46.7,0.8*max_y,'5 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 45;
% h3=text(56.1,0.8*max_y,'6 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39.5;
% h4=text(66,0.8*max_y,'7 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'0.01','0.1','1','10','100','1k','10k'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);

% dim = [0.705 0.035 0.8 0.2];
% str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);


% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);
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
title({'Contágio diário da epidemia',['Comparação entre países em ',datestr(end_time,24)]},'FontSize',fonte_titulo);
xlabel({['Dias desde que se ultrapassou ',num2str(X_cases_pm),' casos'],'(por milhão de habitantes)'},'FontSize',fonte_labels);
ylabel ({'Novos casos por dia','(por milhão de habitantes)'},'FontSize',fonte_labels);
legend ("location", "northeastoutside");
y_init=0.1;
max_y=1000;
% ang = 57;
% h1=text(37.2,0.8*max_y,'números dobram a cada 4 dias');
% set(h1,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 52;
% h2=text(46.7,0.8*max_y,'5 dias');
% set(h2,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 45;
% h3=text(56.1,0.8*max_y,'6 dias');
% set(h3,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);
% ang = 39.5;
% h4=text(66,0.8*max_y,'7 dias');
% set(h4,'Rotation',ang,'color',[0.4,0.4,0.4],'horizontalAlignment', 'right','FontSize',7);

set(gca,'YTickLabel',{'0.1','1','10','100','1k','10k'})

hfonte=text(day_axis,max_y,'Fonte: https://ourworldindata.org/coronavirus-source-data');
set(hfonte,'Rotation',90,'color',[0,0,0],'horizontalAlignment', 'right','verticalAlignment', 'top','FontSize',7);

axis([0 day_axis y_init max_y]);

% dim = [0.705 0.035 0.8 0.2];
% str = {'Obs: Alguns países que estão na legenda não','foram plotados neste gráfico, pois os seus','dados não foram atualizados continuamente,','resultando em curvas de difícil análise.'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',6);



% pra botar o logo no inferior direito
ha =gca;
uistack(ha,'bottom');
% Creating a new axes for the logo on the current axes
% To create the logo at the bottom left corner of the plot use 
% the next two lines
haPos = get(ha,'position');
ha2=axes('position',[haPos([3 1])-[-0.135 0.0], .2,.15,]);
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

outputdir = datestr(end_time,29);
if ~exist([pwd,'/',outputdir], 'dir')
  mkdir([pwd,'/',outputdir]);
end

outputdir2 = name;
if ~exist([pwd,'/',outputdir,'/',outputdir2], 'dir')
  mkdir([pwd,'/',outputdir,'/',outputdir2]);
end

%Controle do site
print(figure(1),[pwd '/upload/',name,'/covid19rj_M_ST_NM_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/upload/',name,'/covid19rj_M_ST_NC_AC_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/upload/',name,'/covid19rj_M_EF_NM_NA_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/upload/',name,'/covid19rj_M_EF_NC_NA_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/upload/',name,'/covid19rj_M_ST_NM_PS_PM_',name,'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/upload/',name,'/covid19rj_M_ST_NC_PS_PM_',name,'.png'],'-dpng','-r400'); 

%Controle do github
print(figure(1),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(2),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_AC_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(3),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NM_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(4),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_EF_NC_NA_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(5),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NM_PS_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 
print(figure(6),[pwd '/',outputdir,'/',outputdir2,'/covid19rj_M_ST_NC_PS_PM_',name,'_',datestr(end_time,29),'.png'],'-dpng','-r400'); 

close all
