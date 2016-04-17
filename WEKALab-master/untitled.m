javaclasspath('/home/harish/Deception_ChallengeIS2016/matlab2weka2015/matlab2weka/matlab2weka.jar');
javaclasspath('/home/harish/WEKALab-master/wekalab.jar');

addpath(genpath('/home/harish/WEKALab-master/'));
cd('/home/harish/WEKALab-master/');
listclassifiers;
% list of all classifier avalilable

%% READ ARFF
M = readarfffile('test/iris.arff'); 

%
 [a p c m] = crossvalidate(M, 'tree', 10);
%The output variables are, in order, 
%a= the overall accuracy on the set, 
% c= an n x n "confusion matrix" where n is the number 
%of classes, 
%p= an n x r matrix of predictions on each point where r
%is the number of points, and 
%m=the model learned on the entire dataset.
% The point-wise prediction vector, p, is something not available in the GUI 
% that comes with WEKA, and proves very handy if you want a breakdown of exactly 
% which points you've gotten wrong. Each row in p has n columns, and each column 
% is the "probability" of that point in the input matrix belonging to the corresponding 
% class according to the model, so the first column in the jth row of p is the
% "probability" that the point M(j,:) belongs to class 0, the second column to class 1, etc.

%%Also note that the function does not randomize your data! 
% If you wish the data to be randomized, you must do it 
% yourself beforehand!
%% TRAIN
 C = trainclassifier(M, 'tree');
 
%  If you wish to classify a point, define the point with the same number of 
%  colums as the input data and then use getclassdistribution:
k1 = [0 0 0 0 0];
p1=getclassdistribution(C, k1);

%Note that getclassdistribution also works for matrices:

p2=getclassdistribution(C, M);

%%
% The important thing, again, is that the matrix have the same number of 
% columns as the training data. The values you use for the classes, obviously,
% can be dummy values, but they must be there. Finally, if you want to output 
%     your matrix to ARFF format for use in e.g., the WEKA GUI:
%%WRITE into ARFF weka format
writearfffile(M, 'iris2.test');

%%Or, for example:

listoptions('svm_rbf');

% Some classifiers, like svm_rbf, have their default options overridden by 
% WEKALab (in this case, to select the RBF kernel).
% 
% For svm_rbf and boost_tree, you can pass in a second "internal options" 
% string, that modifies the parameters of the weak classifier in the case of 
% adaboost, and the parameters of the kernel in the case of svm_rbf. You can 
% again see these by using listoptions.

%% Read ComParE16 arff file in matlab
addpath(genpath('/home/harish/Deception_ChallengeIS2016/dist/arff/'));

compare_train = readarfffile('/home/harish/Deception_ChallengeIS2016/dist/arff/ComParE2016_Deception.ComParE.train.arff');
compare_devel = readarfffile('/home/harish/Deception_ChallengeIS2016/dist/arff/ComParE2016_Deception.ComParE.devel.arff');
compare_test = readarfffile('/home/harish/Deception_ChallengeIS2016/dist/arff/ComParE2016_Deception.ComParE.test.arff');

%% saving Baseline Features
%%correcting file ID, increasing first column by 1
compare_train(:,1)= compare_train(:,1) + 1; 
compare_devel(:,1)= compare_devel(:,1) + 1; 
compare_test(:,1)= compare_test(:,1) + 1; 

save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_train_baseline.mat', 'compare_train');
save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_devel_baseline.mat', 'compare_devel');
save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_test_baseline.mat', 'compare_test');
 
save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_train_baseline.txt', 'compare_train', '-ASCII');
save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_devel_baseline.txt', 'compare_devel', '-ASCII');
save('/home/harish/Deception_ChallengeIS2016/baseline_features_labels_text/compare_test_baseline.txt', 'compare_test', '-ASCII');
