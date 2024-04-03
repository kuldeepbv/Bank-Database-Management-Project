In the Zip file, you can find the following files: 

Python_Script_for_Generating_Data : This Jupyter notebook compiles all the code utilized for generating data across multiple tables.

.csv files: These files contain the data that we have to load into the tables. Each CSV file corresponds to specific tables and contains the respective data entries.

create.sql : We have created this sql script for creating the tables in our database.

load.sql : We have created this sql script to bulk load the generated data into their respective tables. 

Data Generation : 

We have generated the tables like Manager, Branch, Customer, Loan, Account_info, and Account_Balance using Faker in Python. Faker was used to generate synthetic data to simulate various scenarios for these tables.

For the Employee_pos table, only 5 positions with their respective salaries were created manually. Similarly, for Employee_Info, every branch was assigned all 5 positions, ensuring that every branch has an employee covering each position.

The Transactions table data was manually created directly in PgAdmin. The data includes a mix of transfer, withdrawal, and deposit transactions. Additionally, the transaction_id for each entry was automatically generated as a UUID data type.

You can follow the steps given below:

1. Using the create.sql file, you can run this file for creating all the tables.

2. Using the load.sql file, you can run this file for importing all the data from the csv files to the tables.

3. Now, you can perform any sql query you want to.