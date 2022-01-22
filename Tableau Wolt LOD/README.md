# Cohort Analysis for Wolt Delveries 

## Project Overview 

Customer retention can be described as a way to look at how engaged and loyal customers are, that is, whether they continue using the service after their first purchase.
In this Project we want to see how well Wolt manages to retain its customers month after month based on when users made their first ever purchase.

## About the data

The data consists of two files:

* first_purchases.xlsx ,you can access it from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/first_purchases.xlsx)
* purchases.xlsx ,you can access it from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/purchases.xlsx)

The data is an artificial dataset that could be produced by Wolt purchase process, where a user makes their first and possibly following purchases from Wolt.
These purchases have been separated into two files, the first one containing only the users’ first ever purchases from Wolt, and the second one containing all purchases
from these users.

## Objectives

Create visualizations showing the monthly customer retention per product line to communicate the following:

* Cohort based monthly retention for Retail product line
* Cohort based monthly retention for Restaurant product line

## SQL Query 

* I used SQL to prepare the data for visualization in Tableau by union all the data and separate them depending on the product line either "Restaurant" or "Retail store".
* View the SQL query for "Restaurant" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/SQLQueryRest.sql)
* View the SQL query for "Retail store" from [HERE](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/SQLQueryRetail.sql)

## Tableau Visualisation 

* In this project I did minimal Data preparation using SQL because I used Tableau powerfull features , I plotted the data using LOD (calculated field)
* View the Highlight table visualisation from [HERE](https://public.tableau.com/app/profile/omar.banat/viz/CustomerretentionT/Dashboard1)

![alttext](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/Images/Table.JPG)

* View the Line visualisation from [HERE](https://public.tableau.com/app/profile/omar.banat/viz/Customerretention_16427738712160/Dashboard2)

![alttext](https://github.com/omarov10001/Portfolio/blob/main/Tableau%20Wolt%20LOD/Images/Line.JPG)

## Conclusions
* Restaurants have higher overall customer retention .
* There has been strong drop of Retail customer retention for the cohort of march on the months of (April , July and October).
* There has been strong drop of Restaurant customer retention for the cohort of march on the April.
* The rest of the fields look stable and steady.
* The data had to have details about the revenue so we are able to make more clear business decisions  

