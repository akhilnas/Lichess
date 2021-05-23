# Lichess

SQL Queries performed on the Lichess Chess Database of Games played on its Platform.

## Table of contents
1. [About the Dataset](#introduction)
2. [Motivation](#paragraph1)    
3. [Sample Query](#paragraph2)
4. [How To Run](#paragraph3)



## About the Dataset <a name="introduction"></a>
The Lichess Chess Database is found on [Kaggle][1]. I would like to thank the dataset uploader Mitchell J for gviving the public an oppurtunity to explore this dataset.

[1]: https://www.kaggle.com/datasnaek/chess

## Motivation <a name="paragraph1"></a>
The Motivation behind this is to examine the Chess Databse to gain insights into the Players that compete on the Lichess Platform. Their Play Styles, Success rates, their improvement over time and other metrics are looked into.

## Sample Query <a name="paragraph2"></a>
This section shows an Example Query that is implemented in the Microsoft SQL Query File.

```sql
   SELECT * 
   FROM Lichess..games
```
## How To Run <a name="paragraph3"></a>
These queries were developed within the framework of the Microsoft SQL Server Management Studio([Link][2]) though this can be executed within any appropriate framework.

[2]: https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15

