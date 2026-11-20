![Static Badge](https://img.shields.io/badge/SQL-blue)  
# Cyberattacks Dataset  

## Contents

- [Purpose](#purpose)
- [Objectives](#objectives)
- [Skills](#skills)
- [Specific Skills](#specific-skills)
- [Steps](#steps)
- [Key Insights](#key-insights)
- [SQL](#sql)

## Purpose

The purpose of this project is to demonstrate my SQL, data cleaning and data analysis skills using a cyberattacks dataset. It also showcases my interest in intelligence analysis and my willingness to develop these skills further.

## Objectives

- Identify patterns within cyberattack records associated with the UK.
- Examine the most frequently recorded attack types.
- Investigate the distribution of recorded source countries.
- Explore affected systems and network protocols.
- Compare the detection labels and confidence scores recorded in the dataset.
- Identify limitations within the data and consider how these affect the findings.

## Skills

| Technical Skills | Soft Skills |
|---|---|
| SQL | Critical thinking |
| MySQL | Attention to detail |
| Data cleaning | Problem solving |
| Data transformation | Organisation |
| Data validation | Analytical thinking |
| Data analysis | Written communication |

## Specific Skills

| SQL Functions & Statements | SQL Skills |
|---|---|
| SELECT | Database creation |
| WHERE | Filtering records |
| GROUP BY | Data aggregation |
| ORDER BY | CSV data import |
| COUNT | Data type conversion |
| COUNT (DISTINCT) | Identifying unique records |
| SUM | Conditional calculations |
| AVG | Statistical analysis |
| MIN / MAX | Identifying value ranges |
| ROUND | Numerical formatting |
| TRIM | Removing unwanted whitespace |
| NULLIF | Handling blank values |
| REGEXP | Data validation |
| CAST |  |
| STR_TO_DATE |  |

## Steps

**Data Acquisition**
- Obtain cyberattacks dataset CSV.
- Import the dataset into MySQL.

**Database Development**
- Creat the Cyberattacks database.
- Examined the imported table structure.
- Established a separate table for cleaned and transformed data.
- Preserved the original imported table for reference.

**Data Preparation**
- Investigated missing and incomplete values.
- Checked for duplicate attack IDs.
- Validated numeric columns before conversion.
- Removed unwanted whitespace and standardised blank values.
- Converted relevant columns into appropriate data types.
- Converted timestamp values into DATETIME format where possible.
- Compared original and cleaned record counts.

**SQL Analysis**
- Analysed the distribution of attacks across destination countries.
- Investigated source countries associated with UK-targeted attacks.
- Identified frequently recorded attack types.
- Examined protocols and destination ports.
- Analysed affected systems.
- Compared machine-learning detection labels and confidence scores.
- Investigated combinations of source countries, attack types and affected systems.

**Intelligence Assessment**
- Consolidated the findings from the SQL analysis.
- Identified recurring patterns and notable observations.
- Considered the potential significance of the findings.
- Evaluated data limitations and intelligence gaps.

**Final Presentation**
- Organised the analysis into key findings.
- Developed an intelligence-style assessment.
- Presented the results in a clear and structured format.

## Key Insights

- The dataset contains **1,000 records**, of which **98 are associated with the United Kingdom as the destination country**.
- All 98 UK-targeted records have unique Attack IDs, meaning there are **no duplicate attack identifiers** within this subset.
- The dataset contains **10 different source countries associated with UK-targeted attacks**.
- There are **20 recorded attack-type categories in the UK subset**, although one record has a missing attack type.
- **India** is the **most frequently recorded source country associated with UK-targeted attacks** with **14 records**.
- **South Korea ranks second with 13 records**, third **Russia and the USA, each with 12 records**.
- **The UK itself is the recorded source country in 11 records**, demonstrating that the dataset also contains attacks where the recorded source and destination countries are both the UK.
- The **small differences** between the most frequently recorded source countries **suggest that there's no major attacks stemming from specific countries**.
- **Cryptojacking is the most frequently recorded attack type** targeting the UK, appearing in **11 records**.
- **SQL Injection, Advanced Persistent Threats (APT), Ping of Death and Remote Desktop Protocol (RDP)** attacks each appear in **8 records**.
- The distribution demonstrates that the dataset contains a **variety of attack categories rather than one overwhelmingly dominant threat type**.
- **ICMP is the most frequently recorded network protocol**, appearing in **39 UK-targeted records**.
- **TCP appears in 31 records**, and **UDP accounts for the remaining 28**.
- The relatively balanced distribution between TCP and UDP, alongside the higher representation of ICMP, indicates a **varied use of network protocols within the dataset.**
- All 98 UK-targeted records have different destination port values, meaning **no individual destination port appears more than once.**
- Tthe analysis **does not identify a recurring destination port** or a particular port that dominates the UK-targeted records.
- The Port Type column contains the value Other for all 98 UK-targeted records, providing **no further differentiation between port categories**.
- **Firewalls** are the **most frequently recorded affected system**, appearing in **16 UK-targeted records**.
- **Application Servers** rank second, with **13 records**, followed by **Network Routers** with **12 records**.
- **Database Servers** appear in **11 records**, and **Web Servers** appears in **10 records**.
- **Other** affected systems include **IoT Devices, Email Servers, Workstations and Cloud Storage**.
- The findings suggest that **network infrastructure, application environments and database systems are the most commonly affected systems**.
- The dataset identifies system types rather than specific organisations or industry sectors, so it cannot establish which UK businesses or sectors are most frequently targeted.
- Of the 98 UK-targeted records, **45 are labelled Detected (45.9%)**, **while 53 are labelled Not Detected (54.1%)**.
- Among the five machine-learning models represented, **Neural Network has the highest recorded detection proportion**, identifying **13 out of 21 records (61.9%)**, **Random Forest** has the lowest at **38.1%**.
- The **average confidence** score across UK-targeted records is **0.516**.
- **Records labelled Detected** have a **higher average confidence score** of approximately **0.780**, compared with **0.293 for records labelled Not Detected**.
- **Neural Network has the highest average confidence** score among the five models, at approximately **0.585**.
- **Random Forest** has an average confidence score of **0.479**.
- Source-country information can't independently establish the identity or geographical location of an attacker.
- The dataset does not contain organisation names or industry-sector information, preventing direct analysis of the most frequently targeted UK organisations or industries.
- Machine-learning detection labels and confidence scores can't independently establish detection accuracy without verified outcomes.
  
Based on the findings, I would recommend further investigating the attack categories most frequently represented in the UK-targeted records, specifically Cryptojacking, SQL Injection, Advanced Persistent Threats and Remote Desktop Protocol attacks.  
I would also recommend investigating the prominence of ICMP traffic and the frequency with which firewalls, application servers and network routers appear as affected systems. This could help identify recurring relationships between attack types, network protocols and affected infrastructure.  
The machine-learning findings suggest that Neural Network has the highest recorded detection proportion and average confidence score. However, further testing against independently verified attack outcomes would be necessary to evaluate the actual performance of each model.  
From an intelligence perspective, additional research into the recorded source countries could provide useful geographical context. However, source-country associations should be treated cautiously and as they can't be used as evidence of attribution without additional information.  

## SQL

[SQL Code](SQL_Code/CyberAttacksAnalysis.sql)

###### Original data is located in files
