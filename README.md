# Campgain-and-Agent-preformance
𝗗𝗮𝘁𝗮 𝗰𝗹𝗲𝗮𝗻𝗶𝗻𝗴
- the project is about track the campaign performance and the agent productivty 
first step the data needed to clean , using python to acessce the data and calculate the percentage of the null values 
all the columns with more than 70% null values will be deleted as it is not usefull 

![ScreenShot_20230105154031](https://user-images.githubusercontent.com/61375401/210793486-6bf37c8b-99bc-4d74-820b-4b6f8323d0c7.jpeg)

- In this phase, I decided to replace the null values in columns with fewer than 70% null values with the mean if the data type in the column is numircal or the mode if the data type is catigorical some columns replaced using (find/replace) in excel like the [method_of_contact] column to get the data in this shape 


![ScreenShot_20230105155238](https://user-images.githubusercontent.com/61375401/210796578-f72eb6a7-c0e1-4d47-a01b-ec124433bce2.jpeg)

- this some rplacements with python 

![ScreenShot_20230105155304](https://user-images.githubusercontent.com/61375401/210796873-01f335de-189f-4a20-a06c-9fe91d2c0053.jpeg)

𝗔𝗻𝗮𝗹𝘆𝘀𝗶𝘀
- In this phase, I decided to import data from execl sheets into a database in SQL Server in order to build SQL queries for analysis. I used a programme called SQL Server Import and Export Data.

![ScreenShot_20230105160415](https://user-images.githubusercontent.com/61375401/210798328-c8191447-25df-41be-97aa-6e397c9b5286.jpeg)

𝗱𝗮𝘀𝗵𝗯𝗼𝗮𝗿𝗱
- i used power bi for viualse step with the conection between the database and power bi the data will be updated all the time 

![ScreenShot_20230105161120](https://user-images.githubusercontent.com/61375401/210799829-b6c6f39d-cd34-43aa-9782-70bc9f2ca703.jpeg)
