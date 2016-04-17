-----------How to use con_libsvm_arff.pl code-----------------------------------

perl con_libsvm_arff.pl [libsvm format file] [output arff file]

This code converts libsvm format file to an arff file that can be used with weka.

---------- How to use feature_processing.pl code ------------------------------- 

The train_data.txt & test_data.txt are the original data files taken from http://stats.espncricinfo.com/ci/engine/records/index.html?id=6;type=team
These files are processed by text_processing.pl file to output libsvm format files (features).

Example running of the file: 

perl feature_processing.pl train_data.txt country_codes.txt Places_in_India.txt winning_percentages.txt >  example.txt

The above code will generate a libsvm format feature file. From the file some lines have to be deleted that correspond to opponent countries like: Hong Kong, U.A.E., East Africa, 
Bermuda, Scotland, Ireland etc. India hasn't played much of matches against these countries so removing their data doesn't make much of difference. Only the countries mentioned in file: country_codes.txt are taken. The perl code also outputs a temporary file tmp.txt. The file tmp.txt is just a refined version of original data file train_data.txt/test_data.txt and can be deleted after getting the final libsvm format files.  

Apart from this libsvm and weka were used extensively for the project.


------- Description of other files in the folder-------------------------------

svm_train.txt: libsvm format feature file for training data obtained after running the feature_processing.pl code.

svm_train.arff: The arff format of the above mentioned file after running the con_libsvm_arff.pl code.

svm_lib_format_test.txt: libsvm format feature file for test data obtained after running the feature_processing.pl code. 

svm_lib_format_test.arff:The arff format of the above mentioned file after running the con_libsvm_arff.pl code.

svm_train_log5.txt:libsvm format feature file for training data obtained after running the feature_processing.pl code with added log5 feature.

svm_train_log5.arff:The arff format of the above mentioned file after running the con_libsvm_arff.pl code.

svm_test_log5.txt:libsvm format feature file for test data obtained after running the feature_processing.pl code with added log5 feature.

svm_test_log5.arff:The arff format of the above mentioned file after running the con_libsvm_arff.pl code


