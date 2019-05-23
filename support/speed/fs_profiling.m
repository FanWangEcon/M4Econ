close all;
clear all;
profile off;
profile on;
vf_okz_vec();
profile off;
profile viewer;
% THis generates a very large number of HTML files, but clickable
profsave(profile('info'),'C:/Users/fan/ThaiForInfLuuRobFan/matlab/inf_okz/solve/_profile/vf_okz_vec');

profsave(profile('info'),'C:/Users/fan/ThaiForInfLuuRobFan/matlab/inf_okz/solve/_profile/vf_okz_interp');
