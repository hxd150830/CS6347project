% CS6347
% Baseball game output prediction
addpath(genpath('/home/harish/CS6347project'));
%
javaclasspath('/home/harish/CS6347project/matlab2weka2015/matlab2weka/matlab2weka.jar');
javaclasspath('/home/harish/CS6347project/WEKALab-master/wekalab.jar');

addpath(genpath('/home/harish/CS6347project/WEKALab-master/'));
%cd('/home/harish/WEKALab-master/');
%listclassifiers;% later
% list of all classifier avalilable
%duke_data= table2array(readtable('/home/harish/CS6347project/data_5teams/Duke'));
duke_data = dlmread('/home/harish/CS6347project/data_5teams/Duke');
duke_data2=change_labels(duke_data);
arffwrite('/home/harish/CS6347project/data_5teams/Duke_arff',duke_data2); 

duke_data_tou = dlmread('/home/harish/CS6347project/data_5teams/Duke_tou');
duke_data2_tou=change_labels(duke_data_tou);
arffwrite('/home/harish/CS6347project/data_5teams/Duke_tou_arff',duke_data2_tou); 
%2
Kentucky_data = dlmread('/home/harish/CS6347project/data_5teams/Kentucky');
Kentucky_data2=change_labels(Kentucky_data);
arffwrite('/home/harish/CS6347project/data_5teams/Kentucky_arff',Kentucky_data2); 

Kentucky_data_tou = dlmread('/home/harish/CS6347project/data_5teams/Kentucky_tou');
Kentucky_data2_tou=change_labels(Kentucky_data_tou);
%arffwrite('/home/harish/CS6347project/data_5teams/Duke_tou_arff',Kentucky_data2_tou); 
%3
NCState_data = dlmread('/home/harish/CS6347project/data_5teams/NCState');
NCState_data2=change_labels(NCState_data);
arffwrite('/home/harish/CS6347project/data_5teams/NCState_arff',NCState_data2); 

NCState_data_tou = dlmread('/home/harish/CS6347project/data_5teams/NCState_tou');
NCState_data2_tou=change_labels(NCState_data_tou);
arffwrite('/home/harish/CS6347project/data_5teams/NCState_tou_arff',NCState_data2_tou); 

%4
Texas_data = dlmread('/home/harish/CS6347project/data_5teams/Texas');
Texas_data2=change_labels(Texas_data);
arffwrite('/home/harish/CS6347project/data_5teams/Texas_arff',Texas_data2); 

Texas_data_tou = dlmread('/home/harish/CS6347project/data_5teams/Texas_tou');
Texas_data2_tou=change_labels(Texas_data_tou);
arffwrite('/home/harish/CS6347project/data_5teams/Texas_tou_arff',Texas_data2_tou); 

%5
UCLA_data = dlmread('/home/harish/CS6347project/data_5teams/UCLA');
UCLA_data2=change_labels(UCLA_data);
arffwrite('/home/harish/CS6347project/data_5teams/UCLA_arff',UCLA_data2); 

UCLA_data_tou = dlmread('/home/harish/CS6347project/data_5teams/UCLA_tou');
UCLA_data2_tou=change_labels(UCLA_data_tou);
arffwrite('/home/harish/CS6347project/data_5teams/UCLA_tou_arff',UCLA_data2_tou); 

%% READ ARFF
%M = readarfffile('test/iris.arff')

baseline_feats_train= readarfffile('/home/harish/experiment-pipeline/dist07March_Deception/arff/ComParE2016_Deception.ComParE.train.arff');

baseline_feats_devel= readarfffile('/home/harish/experiment-pipeline/dist07March_Deception/arff/ComParE2016_Deception.ComParE.devel.arff');

baseline_feats_test= readarfffile('/home/harish/experiment-pipeline/dist07March_Deception/arff/ComParE2016_Deception.ComParE.test.arff');
%% :,6374 seems to be labels
%% 6373 are the static feats from OpenSMILE
%% Use TKEO and MFCC i-vectors
save('/home/harish/experiment-pipeline/dist07March_Deception/baseline_feats_all_meta_info.mat');
%size(baseline_feats_train) 572 X 6375
%size(baseline_feats_devel) 486 X 6375
%size(baseline_feats_test) 572 X 6375
load('/home/harish/experiment-pipeline/dist07March_Deception/baseline_feats_all_meta_info.mat');

addpath('/home/harish/experiment-pipeline/dist07March_Deception/scripts/');
%% save baseline feats as .txt file-to be used with lang's toolkit
train_file_ID= baseline_feats_train(:,1)+1;% only number, correct it by adding 1
train_feats_baseline= baseline_feats_train(:,2:6374);
train_labels_gt= baseline_feats_train(:,6375);
%
devel_file_ID= baseline_feats_devel(:,1)+1;% only number
devel_feats_baseline= baseline_feats_devel(:,2:6374);
devel_labels_gt= baseline_feats_devel(:,6375);
%
test_file_ID= baseline_feats_test(:,1)+1;% only number
test_feats_baseline= baseline_feats_test(:,2:6374);
test_labels_gt= baseline_feats_test(:,6375);
%% use CMVN
%% saving Baseline Features
%%correcting file ID, increasing first column by 1
% compare_train(:,1)= compare_train(:,1) + 1; 
% compare_devel(:,1)= compare_devel(:,1) + 1; 
% compare_test(:,1)= compare_test(:,1) + 1; 
save('/home/harish/experiment-pipeline/dist07March_Deception/train_feats_baseline.txt', 'train_feats_baseline', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/train_file_ID.txt', 'train_file_ID', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/train_labels_gt.txt', 'train_labels_gt', '-ASCII');

save('/home/harish/experiment-pipeline/dist07March_Deception/devel_feats_baseline.txt', 'devel_feats_baseline', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/devel_file_ID.txt', 'devel_file_ID', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/devel_labels_gt.txt', 'devel_labels_gt', '-ASCII');

save('/home/harish/experiment-pipeline/dist07March_Deception/test_feats_baseline.txt', 'test_feats_baseline', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/test_file_ID.txt', 'test_file_ID', '-ASCII');
save('/home/harish/experiment-pipeline/dist07March_Deception/test_labels_gt.txt', 'test_labels_gt', '-ASCII');
%% 
addpath('/home/harish/experiment-pipeline/dist07March_Deception/');

train_feats_baseline_cmvn = Zmean2(train_feats_baseline); 
devel_feats_baseline_cmvn = Zmean2(devel_feats_baseline); 
test_feats_baseline_cmvn = Zmean2(test_feats_baseline); 
%% test weka's classifier
X=train_feats_baseline_cmvn ;
Xt=devel_feats_baseline_cmvn;

Y=train_labels_gt;
Yt=devel_labels_gt;

%%
str2(1:572,1:2)= '#';
train_feats_cmvn_kurrent(:,1:6373) = train_feats_baseline_cmvn;
train_feats_cmvn_kurrent2= num2str(train_feats_cmvn_kurrent);

train_feats_cmvn_kurrent_labels = num2str(train_labels_gt);
%% horz cat
train_feats_cmvn_kurrent_final= strcat(train_feats_cmvn_kurrent2, str2,train_feats_cmvn_kurrent_labels);

dlmwrite('/home/harish/experiment-pipeline/dist07March_Deception/train_feats_cmvn_kurrent_final.txt',train_feats_cmvn_kurrent_final,'delimiter',' ','precision',10);

dlmwrite('/home/harish/experiment-pipeline/dist07March_Deception/train_feats_cmvn_kurrent_final.txt',train_feats_cmvn_kurrent_final,'delimiter',' ','precision',10);
%save('/home/harish/experiment-pipeline/dist07March_Deception/train_feats_cmvn_kurrent_final.txt', 'train_feats_cmvn_kurrent_final', '-ASCII');
%%devel  kurrent format

str3(1:486,1:2)= '#';%devel
str4(1:497,1:2)= '#';

devel_feats_cmvn_kurrent(:,1:6373) = devel_feats_baseline_cmvn;
devel_feats_cmvn_kurrent2= num2str(devel_feats_cmvn_kurrent);
%%
output_train = '/home/harish/experiment-pipeline/dist07March_Deception/train_feats_baseline_cmvn_11march.txt';
fidw=fopen(output_train,'w');

%str_train = sprintf(' %d %s',C{:})

for ii=1:size(train_feats_baseline_cmvn,1)
   
    for jj=1:size(train_feats_baseline_cmvn,2);
    
   fprintf(fidw,num2str(train_feats_baseline_cmvn(ii,jj)));
  fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,2)));
   % fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,3)));
    %str = sprintf('%d',round(pi))
    end 
    fprintf(fidw,'\n');
end

fclose(fidw);
% trian cmvn labels
output_train = '/home/harish/experiment-pipeline/dist07March_Deception/train_labels_gt_11march.txt';
fidw=fopen(output_train,'w');

%str_train = sprintf(' %d %s',C{:})

for ii=1:size(train_labels_gt,1)
   
    %for jj=1:size(train_feats_baseline_cmvn,2);
    
   fprintf(fidw,num2str(train_labels_gt(ii,1)));
  %fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,2)));
   % fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,3)));
    %str = sprintf('%d',round(pi))
    %end 
    fprintf(fidw,'\n');
end

fclose(fidw);
%% 
output_train = '/home/harish/experiment-pipeline/dist07March_Deception/devel_feats_baseline_cmvn_11march.txt';
fidw=fopen(output_train,'w');

%str_train = sprintf(' %d %s',C{:})

for ii=1:size(devel_feats_baseline_cmvn,1)
   
    for jj=1:size(devel_feats_baseline_cmvn,2);
    
   fprintf(fidw,num2str(devel_feats_baseline_cmvn(ii,jj)));
  fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,2)));
   % fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,3)));
    %str = sprintf('%d',round(pi))
    end 
    fprintf(fidw,'\n');
end

fclose(fidw);
% trian cmvn labels
output_train = '/home/harish/experiment-pipeline/dist07March_Deception/devel_labels_gt_11march.txt';
fidw=fopen(output_train,'w');

%str_train = sprintf(' %d %s',C{:})

for ii=1:size(devel_labels_gt,1)
   
    %for jj=1:size(train_feats_baseline_cmvn,2);
    
   fprintf(fidw,num2str(devel_labels_gt(ii,1)));
  %fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,2)));
   % fprintf(fidw,',');
    %fprintf(fidw,num2str(vsNorm(i,3)));
    %str = sprintf('%d',round(pi))
    %end 
    fprintf(fidw,'\n');
end

fclose(fidw);



%%
sprintf('%s', devel_feats_cmvn_kurrent);


devel_feats_cmvn_kurrent_labels = num2str(devel_labels_gt);
%% horz cat
devel_feats_cmvn_kurrent_final= strcat(devel_feats_cmvn_kurrent2, str3,devel_feats_cmvn_kurrent_labels);
dlmwrite('/home/harish/experiment-pipeline/dist07March_Deception/devel_feats_cmvn_kurrent_final.txt',devel_feats_cmvn_kurrent_final,'delimiter',' ','precision',10);
%save('/home/harish/experiment-pipeline/dist07March_Deception/devel_feats_cmvn_kurrent_final.txt', 'devel_feats_cmvn_kurrent_final', '-ASCII');
%%
test_feats_cmvn_kurrent(:,1:6373) = test_feats_baseline_cmvn;
test_feats_cmvn_kurrent2= num2str(test_feats_cmvn_kurrent);

test_feats_cmvn_kurrent_labels = num2str(test_labels_gt);
%% horz cat
test_feats_cmvn_kurrent_final= strcat(test_feats_cmvn_kurrent2, str4,test_feats_cmvn_kurrent_labels);
%save('/home/harish/experiment-pipeline/dist07March_Deception/test_feats_cmvn_kurrent_final.txt', 'test_feats_cmvn_kurrent_final', '-ASCII');
dlmwrite('/home/harish/experiment-pipeline/dist07March_Deception/test_feats_cmvn_kurrent_final.txt',test_feats_cmvn_kurrent_final,'delimiter',' ','precision',10);
%%PCA and LSSVM
save('/home/harish/experiment-pipeline/dist07March_Deception/newFeatsBaselineCMVN.mat');
%%%
load('/home/harish/experiment-pipeline/dist07March_Deception/newFeatsBaselineCMVN.mat');
%

% dlmwrite('/home/harish/experiment-pipeline/dist07March_Deception/test_feats_cmvn_kurrent_final.txt',test_feats_cmvn_kurrent_final,'delimiter',' ','precision',10);
% mystring = ['!' mypath];
% eval(mystring);
% sprintf(train_feats_cmvn_kurrent(:,6374),'#');
% train_feats_cmvn_kurrent(:,6374) = ;
% train_feats_cmvn_kurrent(:,6375) = '#';
% (:,6376) = train_labels_gt;
% save('/home/harish/experiment-pipeline/dist07March_Deception/train_feats_cmvn_kurrent.txt', 'train_feats_cmvn_kurrent', '-ASCII');

% h1=figure(1);
% imagesc(10*log10(abs(train_feats_baseline)));
% colorbar;
% 
% h2=figure(2);
% imagesc(10*log10(abs(train_feats_baseline_cmvn)));
% colorbar;
