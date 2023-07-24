
Data-Sets: This folder contains data-sets used in paper.
--- Eclipse-3.0, 2.Eclipse-2.1, POI-2.5, POI-3.0, Camel-1.6, JDTCore-3.4, Lucene-2.4 
--- each file is matrix of packages as rows and studies metrics as columns 
     
R-Script: This folde mainly 1 .R script file having 4 functions. 

 1. EffortAwareRankingRandom(pathRandom): It is function that generates random graph for faults on y-axis and KSLOC on x-axis 

 2. EffortAwareRankingIdeal(pathIdeal): It is function that generates Ideal graph for Packages with large number of faults ordered against least KSLOC on y-axis and x-axis respectively 
  
 3. EffortAwareRankingTModel(pathTmodel): It is funtion that generates graph for Robert Martin metrics predict faults against KSLOC on y-axis and x-axis respectively 
  
 4. EffortAwareTplusHAbdeenModel(pathTHabdeen): It is function that generates graph for Rober Martin+H.Abdeen predicted faults against KSLOC on y-axis and x-axis respectively 


=====================================================
= How to run 
=====================================================
1.) set the path of project from dataset folder
2.) Execute code of all the 4 functions together 
3.) Call four function to see graph for each project as depicted in the Figure: 2
 

Note:- Repeat these steps for all the projects to reproduce graphs presented in the Figure: 2  