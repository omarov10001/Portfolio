# Monthly Cohort Analysis for Wolt Delveries 

##  Overview 

Customer retention can be described as a way to look at how engaged and loyal customers are, that is, whether they continue using the service after their first purchase.
In this Project we want to see how well Wolt manages to retain its customers month after month based on when users made their first ever purchase.

## About the data

The data consists of two files:

* first_purchases.xlsx ,you can access it from [HERE](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/first_purchases.xlsx)
* purchases.xlsx ,you can access it from [HERE](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/purchases.xlsx)

The data is an artificial dataset that could be produced by Wolt purchase process, where a user makes their first and possibly following purchases from Wolt.
These purchases have been separated into two files, the first one containing only the users’ first ever purchases from Wolt, and the second one containing all purchases
from these users.

## Objectives

Create visualizations showing the monthly customer retention per product line to communicate the following:

* Cohort based monthly retention for Retail product line
* Cohort based monthly retention for Restaurant product line
## Methodology 

I used two methods to manipulate the data and get it ready for Tableau visualization :
1.Using SQL to manipulate the data , the result is ready table for visualization using Tableau.
2.Using SQL , I union the both raw tables and then using Tableau LOD , I visualize the data.

## SQL Query 
### The First approach:

* The Query aim  is to get table with 4 columns cohort month , cohort size , month number in the relation of the cohort 
month and percentage of customer retention of that month 
* I Separated the users depending of the product line 
* View the SQL query where the product line is  "Restaurant" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/SQLRest.sql)
* View the SQL query where the product line is  "Retail store" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/SQLRetail.sql)

The result of the SQL query looks like this 

![alttext](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/Images/SQLRest.JPG)

### The Second approach:

* I used SQL to prepare the data for visualization in Tableau by union all the data and separate them depending on the product line either "Restaurant" or "Retail store".
* View the SQL query for "Restaurant" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/SQLQueryRest.sql)
* View the SQL query for "Retail store" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/SQLQueryRetail.sql)

## Tableau Visualisation

* View the Highlight table visualisation from [HERE](https://public.tableau.com/app/profile/omar.banat/viz/CustomerretentionT/Dashboard1)

![alttext](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/Images/Table.JPG)

* View the Line visualisation from [HERE](https://public.tableau.com/app/profile/omar.banat/viz/Customerretention_16427738712160/Dashboard2)

![alttext](https://github.com/omarov10001/Portfolio/blob/main/SQL%20Wolt%20Customer%20retention/Images/Line.JPG)
## Discussion
* Restaurants have higher overall customer retention .
* There has been strong drop of Retail customer retention for the cohort of march on the months of (April , July and October).
* There has been strong drop of Restaurant customer retention for the cohort of march on the April.

## Limitations and Future Directions
The present analysis represents the "first phase" of what would become a larger examination . As such, I acknowledge that there are limitations that should be addressed in subsequent analyses.The data had to have details about the revenue so we are able to make more clear business decisions  


## Conclusion
In this project, I examined the  client's question of "how well Wolt manages to retain its customers month after month based on when users made their first ever purchase?" Using artificial dataset that could be produced by our purchase process,I manipulated the data through two approaches using SQL and then I visualized the data using Tableau.Overall Wolt is better in retaining Restaurants customers.

