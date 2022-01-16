#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import libraries 

from bs4 import BeautifulSoup
import requests
import time
import datetime

import smtplib


# In[58]:


# Connect to Website and pull in data

URL = 'https://www.amazon.com/Funny-Data-Systems-Business-Analyst/dp/B07FNW9FGJ/ref=sr_1_3?dchild=1&keywords=data%2Banalyst%2Btshirt&qid=1626655184&sr=8-3&customId=B0752XJYNL&th=1'

headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36", "Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

page = requests.get(URL, headers=headers)

soup1 = BeautifulSoup(page.content, "html.parser")

soup2 = BeautifulSoup(soup1.prettify(), "html.parser")

title = soup2.find(id='productTitle').get_text()

ratings = soup2.find(id="acrCustomerReviewText").get_text()

print(ratings)
print(title)


# In[62]:


ratings = ratings.strip()
title = title.strip()

print(title)
print(ratings)


# In[63]:


# Create a Timestamp for your output to track when data was collected
import datetime
today=datetime.date.today()
print(today)


# In[66]:


# Create CSV and write headers and data into the file
import csv

header = ['Title', 'Ratings', 'Date']
data = [title, ratings, today]

with open("Amazon","w",newline="",encoding='UTF8')as a:
    writer=csv.writer(a)
    writer.writerow(header)
    writer.writerow(data)
    
    
    


# In[71]:


import pandas as pd 

df=pd.read_csv(r"C:\Users\HP\Amazon.csv")
print(df)


# In[73]:


#Combine all of the above code into one function


def check_ratingsno():
    URL = 'https://www.amazon.com/Funny-Data-Systems-Business-Analyst/dp/B07FNW9FGJ/ref=sr_1_3?dchild=1&keywords=data%2Banalyst%2Btshirt&qid=1626655184&sr=8-3&customId=B0752XJYNL&th=1'

    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36", "Accept-Encoding":"gzip, deflate", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

    page = requests.get(URL, headers=headers)

    soup1 = BeautifulSoup(page.content, "html.parser")

    soup2 = BeautifulSoup(soup1.prettify(), "html.parser")

    title = soup2.find(id='productTitle').get_text()

    ratings = soup2.find(id="acrCustomerReviewText").get_text()

    ratings = ratings.strip()
    title = title.strip()

    import datetime

    today = datetime.date.today()
    
    import csv 

    header = ['Title', 'Ratings', 'Date']
    data = [title, ratings, today]

    with open('AmazonWebScraperDataset.csv', 'a+', newline='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)
 


# In[ ]:


# Runs check_ratingsno after a set time(day in seconds) and inputs data into your CSV

while(True):
    check_ratingsno()
    time.sleep(86400)


# In[ ]:




