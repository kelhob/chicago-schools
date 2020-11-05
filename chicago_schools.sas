

libname chischools 'C:\Users\kelbla\Documents\Kelly_docs\porfolio\chicago-schools';

proc import datafile="C:\Users\kelbla\Documents\Kelly_docs\porfolio\chicago-schools\chicago-public-schools-progress-report-cards-2011-2012-1.csv"
        out=schools
        dbms=csv
        replace;
    

     getnames=yes;
run;


proc print data=work.shoes;
run;

data schools_noNDA;
	set schools;
    if Parent_Engagement_Score='NDA' then delete;
	if Teacher_Score='NDA' then delete;
	if Environment_Score='NDA' then delete;
	if Safety_Score='NDA' then delete;
run;

proc corr data=schools_noNDA plots=matrix(histogram); 
    VAR Parent_Engagement_Score Teacher_Score Environment_Score Safety_Score;
/*    WITH Parent_Engagement_Score Teacher_Score Environment_Score Safety_Score;*/
run;
