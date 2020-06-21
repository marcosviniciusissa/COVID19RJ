clear all;
close all;
clc;

fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-cities-time.csv'];
filename = 'cases-brazil-cities-time.txt';
urlwrite(fullURL,[pwd '/Dados/',filename]);

fullURL = ['https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'];
filename = 'cases-brazil-states.txt';
urlwrite(fullURL,[pwd '/Dados/',filename]);

covid19rj_M_ST_BR_VA
covid19rj_M_ST_BR_PM
covid19rj_M_MC_BR

covid19rj_M_ST_RB_VA
covid19rj_M_ST_RB_PM
covid19rj_M_MC_RB

covid19rj_M_ST_BR_RE
covid19rj_M_CP_AC_BR
covid19rj_M_CP_PS_BR


script_RJ
% script_WD