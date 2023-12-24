# Pretesting Project
Pre-Testing Project 

I recently undertook a project involving exploratory data analysis (EDA) of pre-test scoring for a credentialing program my division wanted to implement to increase employee competency in a technical field. The analysis aimed to categorize employees for this credentialing program based on their performance on this pre-test. 

Although I initially used Excel for this task, I wanted to see how R might enable a more robust analysis, given its superior capabilities in EDA standardization and visualization options. 

This article explores my approach to developing a standardized exploratory data analysis (EDA) process in R, focusing specifically on test score analysis. Furthermore, I delve into the intricacies of the R model, utilizing an AI-generated synthetic dataset that I prompted ChatGPT to create. 

Overall, I hope this article helps show how EDA in R can be fun and useful. 

## Initial Analysis in Excel
First, I analyzed the pre-test scores of a sample group of employees (n=12) to establish scoring bands. Despite the small sample size, it was sufficient for a modified EDA in Excel and to develop scoring bands. Scoring bands were set for this project to determine the appropriate course of action for employees based on their pre-test scores. The options the score bands were set around included: 

- Attending a BootCamp, 
- Proceeding to the credential test, or 
- Opting for pre-testing for a higher-level credential.

To pass the credentialing exam, employees must achieve a minimum score of 70%. Therefore, analyzing individual pre-test scores and comparing them based on the supported program provides insights into the performance trends of specific programs. This analysis also aids in assessing the need for adjustments to scoring bands at both the program and organization levels, rather than solely at the organizational level.

Using this Excel-based EDA approach (even with the small sample), I successfully established preliminary scoring bands. As a result, I was able to provide the stakeholders with the essential feedback required to make informed decisions regarding credentialing the employee population.

However, after completing the analysis in Excel, I recognized a need for a more standardized approach for ensuring consistency and efficiency across future projects. So, I opted for R to build an EDA framework for handling and reporting pre-test score analytics more effectively.

## Synthetic Data Creation with ChatGPT

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/84d9f4d0-fbc1-423e-a9e9-61b5f1c1f500)

To test any EDA framework, I first needed a robust dataset. For this, I decided to use ChatGPT to generate synthetic data, mimicking the format of my original dataset. In ChatGPT, I prompted it to deliver 100 observations across three variables: Agent_ID, Program, and Test_Score. Here is the original prompt I used to get the dataset developed

> let's say i want to analyze test scores from agents who took a pre-test which will allow us to determine what the band of scores should be to determine if they should be allowed to test for the exam directly, take a BootCamp for the exam, or be recommended for a more advanced course. I need synthetic data for a csv based on the following columns: Agent_ID, Program, Test_Score. The programs will be Agency Service Desk,  Agency Helpdesk, Agency Contact Center. The Service Desk agents are likely to score higher. I need 100 rows of data for the csv with test scores ranging from 30-96.

By explicitly mentioning in the prompt that the service desk agents would likely attain higher scores, ChatGPT generated a wider range of synthetic data. This enabled me to explore exploratory data analysis (EDA) questions that I otherwise might not have considered. Additionally, I was able to develop standardized code for analyzing similar datasets in the future.

## Implementing the Analysis in R

I then imported the synthetic data from ChatGPT into R to put my EDA framework to the test. Key libraries I employed included:
- 'ggplot2' for sophisticated data visualizations.
- 'tidyverse' for efficient data manipulation.
- 'shiny' for developing an interactive web application to display the analysis results.

To begin the EDA process, I reviewed the data using the 'summary' function. 

```> summary(data)
   Agent ID           Program            Test Score   
 Length:100         Length:100         Min.   :30.00  
 Class :character   Class :character   1st Qu.:60.50  
 Mode  :character   Mode  :character   Median :71.00  
                                       Mean   :68.54  
                                       3rd Qu.:82.25  
                                       Max.   :95.00
``` 

This allowed me to see the dataset's interquartile range and other descriptive statistics. I then wanted a density plot to visualize the skewness within those quartiles. 

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/9cec6a95-0639-4a34-b03c-4e247fb7d854)

To visualize the test score distribution, I then created a histogram.

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/8f8e32e9-679f-4f2d-9390-68aeb64402ce)

I then wanted to see the distribution of scores by program, so I utilized the pseudonyms Agency Contact Center, Agency Helpdesk, and Agency Service Desk as temporary titles to represent the actual programs from which the pre-test participants would originate. This allowed for clarity and ease of understanding during the process.

Having this code in place would also allow me to have a mechanism in place to visualize the scoring distribution among and with each of the programs.

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/75bfc961-0a45-44fb-9df6-547323cfb226)

To visualize the mean scores, I executed a code snippet, which produced the following chart.

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/707d3c43-775b-4f4c-894e-9735e30e2d62)

## Using Shiny

I leveraged the 'shiny' library to present the data more intuitively. EIn essence, 'shiny' generates a web-based dashboard that enables users to interact with data effortlessly, eliminating the need to navigate through cumbersome paper reports or other documents.

I implemented a dropdown menu in the tool to neatly organize the data based on agents and programs. This intuitive feature visually presents everyone's scores within each program, enabling stakeholders to easily distinguish individual scores in relation to the cutoff score.

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/fb3a93f9-7594-4600-b9a3-85b842b6ab55)

I also developed an additional visualization in 'shiny' that provides stakeholders with a visual representation of the scoring distribution through boxplots.

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/10a801a6-0f91-44f5-b9b5-166f9e3457e9)

![image](https://github.com/rapp2043/Pretesting-Project/assets/20693928/146e355a-79a6-4aa1-ad49-508b01c0923e)

## Enhancing Reporting with R Markdown and 'bookdown'

Realizing the importance of clear and professional reporting, I am now integrating my R code into R Markdown, with the intent of eventually migrating it over to Yihui Xie's 'bookdown' library framework to produce LaTeX reports. This would combine the power of R with the elegance of LaTeX for documentation.

For me, however, the ultimate objective consists of two parts: firstly, to have a prebuilt user-friendly web application that seamlessly accommodates incoming data, enabling stakeholders to engage in interactive data exploration. Secondly, to generate a comprehensive and meticulously organized LaTeX report that facilitates in-depth analysis.

## Future Perspectives

This project is an ongoing journey. I've made a load of mistakes along the way, but continue to learn so much everytime I dive in. As I go deeper into R's capabilities, I'm excited to see how integrating advanced features and libraries will enhance my data analysis skills and the quality of the products I generate. The combination of R's analytical power, LaTeX's documentation proficiency, and Shiny's interactive capabilities presents a promising path for future explorations in data analysis and reporting.






