
Data-Sets: This folder contains data-sets used in paper.
--- Eclipse-3.0, 2.Eclipse-2.1, POI-2.5, POI-3.0, Camel-1.6, JDTCore-3.4, Lucene-2.4 
--- each file is matrix of packages as rows and studies metrics as columns 
     
R-Script: This folde mainly three .R script files. 
1. EffortAware_T_Model:- It has function to generate the  results of T model as depicted in Table 6 
2. EffortAware_H.Abdeen_Model:- It has function to generate the  results of H.Abdeen model as depicted in Table 6 
3. EffortAware_(T+H.Abdeen_Model):- It has function to generate the results of H.Abdeen+T model as depicted in Table 6

Note:- each line of in R-Script files is properly commented



=====================================================
= How to run 
=====================================================
1.) set the path of dataset from dataseet folder 
2.) run the entire function of Effort_T_Model.R at general probability threshold of 0.5 (default setting) 
3.) This will output 10-fold 10 times cross validation prediction results for BPP and MFM metric  
4.) First execution shall also list mean values of BPP and MFM 
5.) Now change the threshold of prediction threshold of  BPP  
6.) Re-executet the function to obtain mean and standard deviation values of prediction accuracy 
7.) Now change the prediction threshold of MFM 
8.) Re-executet the function to obtain mean and standard deviation values of prediction accuracy 

Note:- Repeat these steps for all the data and in each .R scripts to replicate and reproduce the results of Table 6. 