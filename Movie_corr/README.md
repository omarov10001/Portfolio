# Movies gross earning analysis

## Project Overview
* We need to know which factors influence the gross earning of movies .
* libraries used are pandas, numpy, matplotlib and seaborn .  
* You can access the code [HERE](https://github.com/omarov10001/Portfolio/blob/main/Movie_corr/Python_Movie_corr.ipynb)

### Objectives

Central question:

which factor affect the gross earning the most ?

Other questions:

What is the relationship between genre and gross earning of the movie?
What is the relationship between the company and gross earning of the movie?
which factors have high correlation to the gross earning of the movie ?


### Data cleaning and preparation

* Check if there any any missing data useing for loop.
* We had conspirancy between year and release date so we correct it .
* Set data types 

#### EDA
* Scatter plot of movies budget vs gross earning 

As we can see there is strong correlation between budget and gross earning of the movie 

![alt text](https://github.com/omarov10001/Portfolio/blob/main/Movie_corr/Images/scatter.JPG)

* We then made correlation Matrix between all numeric columns and plot it using Seaborn 

![alt text](https://github.com/omarov10001/Portfolio/blob/main/Movie_corr/Images/corr.JPG)

* We then manipulate data using "cat.codes" so we can include all columns in the correlation matrix and plot it 

![alt text](https://github.com/omarov10001/Portfolio/blob/main/Movie_corr/Images/corr1.JPG)


##### Conclusions

* The Budget of the movie has the highest correlation to the movie gross earnings 
* The company has low correlation to the movie gross earnings 








