%This is the first hw2 for MVC
%Simulation for input time-delay sampled-data system
%editor: Wang Bo An

clc;clear all;close all;

%set u function input
load(u.mat);
u = [0:0.18:5.4;normrnd(0,1,[1 31])];