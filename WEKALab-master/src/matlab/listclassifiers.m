function listclassifiers()
    %LISTCLASSFIERS lists the classifiers available in WekaLab
    %   LISTCLASSIFIERS shows the defined constants available for use as
    %   the 'type' paramater in TRAINANDTEST, CROSSVALIDATE, and
    %   TRAINCLASSIFIER.  These are string constants.
    javaclasspath('/home/harish/Deception_ChallengeIS2016/matlab2weka2015/matlab2weka/matlab2weka.jar')
javaclasspath('/home/harish/WEKALab-master/wekalab.jar')
    org.clparker.wekalab.WekaInterface.listClassifiers();
end