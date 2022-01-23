% (1) This code describes how to apply Modified t-test in multi-class classfication problem
% for feature selection. It calculates te t-score against each feature and ultimately
% the features are sorted according to their t value.
% 
% (2)More is the t-value more will be the importance of feature for a particular problem.

clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%
% feature set includes 113 features of 334 samples.
% target defines class allotment against each sample.
% t_score defines the score of modified t-test of each feature of different samples.
% Index defines the index of feature according to their t-score.It helps in
%  understanding whch feature is more important.
%feature sorted is the sorted feature vector according to the t-score of
%features.
%%%%%%%%%%%%%%%%%%%%%%

%load feature set
load('feature.mat');

%Modeified t-test
[t_score,Index,feature_sorted] = modified_T_test(feature_set,target);
