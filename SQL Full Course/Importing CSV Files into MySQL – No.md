# Importing CSV Files into MySQL – Notes





### 1\. ✅ LOAD DATA INFILE (Fastest Method)





##### When to Use:



* When you want to import large files quickly (thousands to lakhs of rows).
* When you're using MySQL Workbench or Command Line.
* When you’ve enabled local\_infile.



###### Basic Syntax:



LOAD DATA LOCAL INFILE 'path/to/your.csv'

INTO TABLE your\_table

FIELDS TERMINATED BY ','

ENCLOSED BY '"'

LINES TERMINATED BY '\\n'

IGNORE 1 ROWS;



###### Key Clauses Explained:



* LOCAL: Allows importing files from your local computer.
* FIELDS TERMINATED BY ',': Column separator (usually a comma in CSV).
* ENCLOSED BY '"': Fields (especially text) might be wrapped in double quotes.
* LINES TERMINATED BY '\\n': Each row ends with a newline.
* IGNORE 1 ROWS: Skip the first row (header).



##### Common Errors and Fixes:

Error 3948: Local data loading is disabled. Fix:



###### ⚙️ Before Running



✅ Step 1: Set it in the server (if needed):

SET GLOBAL local\_infile = 1;



✅ Step 2: Update MySQL Workbench settings

If you're getting an error like "Loading local data is disabled", do this:



Go to MySQL Workbench → Manage Connections.



Select your connection and click Edit.



Click the Advanced tab.



In the Others box, paste:



OPT\_LOCAL\_INFILE=1

Save and reconnect to your database.



This enables local file loading from the Workbench client side.







### 2\. ✅ MySQL Workbench - Table Import Wizard



##### When to Use:

For small to medium-sized CSV files.



You want a GUI-based import without writing code.



##### How to Use:

Open MySQL Workbench.



Right-click your schema > Table Data Import Wizard.



Choose your CSV file.



Preview the data and click Next.



Map the columns or let Workbench create a new table.



Finish the import.



### 3\. ✅ Python (Pandas + SQLAlchemy/MySQL Connector)



##### When to Use:

When you want to clean or transform data before import.



##### When automating data pipelines.



###### Sample Code:



import pandas as pd

from sqlalchemy import create\_engine



df = pd.read\_csv('your\_file.csv')



engine = create\_engine("mysql+pymysql://username:password@localhost/dbname")



df.to\_sql('your\_table', con=engine, if\_exists='replace', index=False)

Replace 'replace' with 'append' to add instead of overwrite.



Make sure to install pymysql and sqlalchemy.

