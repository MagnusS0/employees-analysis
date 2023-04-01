# Employee-Analysis
<div class='tableauPlaceholder' id='viz1680351481981' style='position: relative'><noscript><a href='#'><img alt='Dashboard 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;SQ&#47;SQL_Tableau_16774508929360&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='SQL_Tableau_16774508929360&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;SQ&#47;SQL_Tableau_16774508929360&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                

This project analyzes employee data from the Employees Sample Database, a modified version of the original Employees Database that has been enhanced by 365 Data Science. It includes SQL queries that answer various questions about the data such as employee demographics, salary statistics, and department information. It also includes a visualization of the results made in Tableau.

## Files
'employees_analysis.sql': This file contains the SQL queries used to analyze the data.
'README.md': This file.

## Data
The data used in this analysis is the employees_mod Database, a modified version of the original Employees Database that has been enhanced by 365 Data Science. The database contains information about employees working at a fictional company, including their personal details, employment history, salaries, and job titles.
### Schema
![image](https://user-images.githubusercontent.com/97634880/229288132-98371be7-3d30-4cb0-baf6-c7a670dbaf00.png)

## Analysis
The SQL code in 'employees_analysis.sql' extracts data from the employess_mod, performs some transformations and calculations using CASE, AVG, JOIN and COUNT statments. This generates tables that provide insights into employee demographics, departmental performance, and salary distribution. Some of the questions that can be answerd with the retrived data is:
- What is the number of new hires from each year grouped by gender?
- How many department managers where active each year by gender?
- What is the average salary for each department by gender and year?
- What is the average salary in a given range for all departments by gender? (Using a SQL PROCEDURE)
- What is the number of employees in each department by gender?
- What is the average salary for all departments by year?

The visualization in Tableau shows the results of the analysis in a series of charts and graphs that allow users to explore the data and gain insights into the gender distribution and wage gap in the company.

## Usage
To use this repository, you can download the file and run the SQL code in 'employees-analysis.sql' to extract and transform the data. You can also use the link to Tableau to explore the visualization.

## Credits
The Employees Sample Database used in this analysis was created by 365 Data Science. The original Employees Database was created by Fusheng Wang and Carlo Zaniolo of the UCLA Computer Science Department, and is available on GitHub at https://github.com/datacharmer/test_db.

