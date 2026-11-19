![Static Badge](https://img.shields.io/badge/SQL-blue)  
# Cyberattacks Dataset

## Contents

- [Purpose](#purpose)
- [Objectives](#objectives)
- [Skills](#skills)
- [Specific Skills](#specific-skills)
- [Steps](#steps)
- [Previews](#previews)
- [Final Project](#final-project)

## Purpose

The purpose of this project is to demonstrate my SQL, data cleaning, data analysis and intelligence reporting skills using a cyberattacks dataset.
Using SQL and MySQL, I investigate recorded cyberattacks targeting the United Kingdom, examining their source countries, attack types, network protocols, destination ports, affected systems and machine-learning detection results.
The project aims to identify patterns and trends within the dataset, develop meaningful insights and produce an intelligence-style assessment of the cyber threats represented in the data.

## Objectives

**Data objectives**

- Examine the dataset structure and assess its overall quality.
- Identify missing values, duplicate records and inconsistent data.
- Convert relevant columns into appropriate data types.
- Create a separate cleaned table while preserving the original dataset.
- Analyse cyberattacks targeting the UK.
- Identify the source countries most frequently associated with UK-targeted attacks.
- Determine the most frequently recorded attack types.
- Examine commonly used network protocols and destination ports.
- Identify the systems most frequently affected by cyberattacks.
- Compare detection labels and confidence scores across machine-learning models.
- Investigate relationships between source countries, attack types and affected systems.

**Intelligence objectives**

- Identify recurring patterns within UK-targeted cyberattacks.
- Assess which attack categories and systems feature most prominently.
- Examine the distribution of recorded attack sources.
- Evaluate the detection patterns represented in the dataset.
- Develop evidence-based intelligence assessments from the findings.
- Identify limitations and intelligence gaps that could affect the conclusions.

## Skills

| Technical Skills | Intelligence & Analytical Skills | Soft Skills |
|---|---|---|
| SQL | Intelligence analysis | Critical thinking |
| MySQL | Pattern identification | Attention to detail |
| Data cleaning | Threat assessment | Problem solving |
| Data transformation | OSINT research | Organisation |
| Database management | Intelligence reporting | Analytical thinking |
| Data analysis | Evidence-based assessment | Written communication |
| Data validation | Identifying intelligence gaps | |

## Specific Skills

| SQL Functions & Statements | SQL Skills |
|---|---|
| SELECT | Database creation |
| WHERE | Filtering records |
| GROUP BY | Data aggregation |
| ORDER BY | CSV data import |
| COUNT | Data type conversion |
| COUNT DISTINCT | Identifying unique records |
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

- Obtained the original cyberattacks dataset in CSV format.
- Imported the dataset into MySQL.
- Created a dedicated database for the project.

**Database Development**

- Created the Cyberattacks database.
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

**OSINT Research**

- Used open-source research to provide additional context for relevant cyber threats and attack techniques.
- Considered the wider significance of the identified patterns.
- Distinguished dataset findings from externally sourced intelligence.

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

**Overall dataset and UK-targeted attacks**

- The dataset contains 1,000 records, of which 98 are associated with the United Kingdom as the destination country.
- All 98 UK-targeted records have unique Attack IDs, meaning there are no duplicate attack identifiers within this subset.
- The dataset contains 10 different source countries associated with UK-targeted attacks.
- There are 20 recorded attack-type categories in the UK subset, although one record has a missing attack type.
- No UK-targeted records have missing source countries, destination countries, protocols, affected systems or detection labels.
- All 1,000 records in the original dataset have missing timestamps, preventing chronological analysis of attack activity.

**Source country distribution**

- India is the most frequently recorded source country associated with UK-targeted attacks, with 14 records.
- South Korea ranks second, with 13 records, followed by Russia and the USA, each with 12 records.
- The UK itself appears as the recorded source country in 11 records, demonstrating that the dataset also contains attacks where the recorded source and destination countries are both the UK.
- The relatively small differences between the most frequently recorded source countries suggest that the dataset contains a geographically varied distribution of attack sources.
- These figures represent recorded source-country associations and should not be interpreted as independently verified attacker attribution.

**Attack types and threat patterns**

- Cryptojacking is the most frequently recorded attack type targeting the UK, appearing in 11 records.
- SQL Injection, Advanced Persistent Threats (APT), Ping of Death and Remote Desktop Protocol (RDP) attacks each appear in eight records.
- Other recorded attack types include Malware, Distributed Denial of Service (DDoS), Phishing, Cross-Site Scripting (XSS), DNS Tunnelling and Brute Force attacks.
- The distribution demonstrates that the dataset contains a variety of attack categories rather than one overwhelmingly dominant threat type.
- The presence of both application-level attacks, such as SQL Injection and XSS, and network-level attacks, such as Ping of Death and DDoS, highlights the range of attack activity represented in the UK records.

**Network protocols and destination ports**

- ICMP is the most frequently recorded network protocol, appearing in 39 UK-targeted records.
- TCP appears in 31 records, while UDP accounts for the remaining 28.
- The relatively balanced distribution between TCP and UDP, alongside the higher representation of ICMP, indicates a varied use of network protocols within the dataset.
- All 98 UK-targeted records have different destination port values, meaning no individual destination port appears more than once.
- Consequently, the analysis does not identify a recurring destination port or a particular port that dominates the UK-targeted records.
- The Port Type column contains the value Other for all 98 UK-targeted records, providing no further differentiation between port categories.

**Affected systems**

- Firewalls are the most frequently recorded affected system, appearing in 16 UK-targeted records.
- Application Servers rank second, with 13 records, followed by Network Routers with 12 records.
- Database Servers appear in 11 records, while Web Servers account for 10 records.
- Other affected systems include IoT Devices, Email Servers, Workstations and Cloud Storage.
- The findings suggest that network infrastructure, application environments and database systems feature prominently among the affected systems represented in the dataset.
- The dataset identifies system types rather than specific organisations or industry sectors, so it cannot establish which UK businesses or sectors are most frequently targeted.

**Machine-learning detection results**

- Of the 98 UK-targeted records, 45 are labelled Detected (45.9%), while 53 are labelled Not Detected (54.1%).
- The greater number of records labelled Not Detected indicates that more than half of the UK-targeted records fall into this detection category.
- Among the five machine-learning models represented, Neural Network has the highest recorded detection proportion, identifying 13 out of 21 records (61.9%).
- K-Nearest Neighbors follows with a detection proportion of 46.7%, followed by Logistic Regression at 43.8%.
- Support Vector Machine records a detection proportion of 40.0%, while Random Forest has the lowest at 38.1%.
- These percentages describe the proportion of records labelled Detected for each model. They do not establish model accuracy or overall effectiveness because independently verified ground-truth results are not available.

**Confidence scores**

- The average confidence score across UK-targeted records is approximately 0.516.
- Records labelled Detected have a higher average confidence score of approximately 0.780, compared with 0.293 for records labelled Not Detected.
- This indicates a clear difference in confidence scores between the two detection categories within the dataset.
- Neural Network has the highest average confidence score among the five models, at approximately 0.585.
- Logistic Regression follows with an average confidence score of approximately 0.550.
- K-Nearest Neighbors, Support Vector Machine and Random Forest have average confidence scores of approximately 0.488, 0.485 and 0.479 respectively.
- Although Neural Network has the highest recorded detection proportion and average confidence score, further validation would be required before concluding that it performs better than the other models.

**Data quality and analytical limitations**

- All 1,000 records have missing timestamps, preventing the identification of attack trends over time, seasonal patterns or changes in activity.
- One UK-targeted record has a missing attack type, meaning attack-type analysis is based on 97 records with available values.
- All 98 UK-targeted records have unique destination ports, limiting the ability to identify frequently targeted ports.
- The Port Type column contains only the value Other in the UK subset, limiting its usefulness for further port analysis.
- Source-country information cannot independently establish the identity, geographical location or responsibility of an attacker.
- The dataset does not contain organisation names or industry-sector information, preventing direct analysis of the most frequently targeted UK organisations or industries.
- Machine-learning detection labels and confidence scores cannot independently establish detection accuracy without verified outcomes.
- The dataset contains a relatively small UK subset of 98 records, so the findings should not be generalised to the wider UK cyber threat landscape without additional evidence.

**Intelligence recommendations**

Based on the findings, I would recommend further investigating the attack categories most frequently represented in the UK-targeted records, particularly Cryptojacking, SQL Injection, Advanced Persistent Threats and Remote Desktop Protocol attacks. Examining the techniques and potential vulnerabilities associated with these attack categories could provide additional context for understanding their significance.

I would also recommend investigating the prominence of ICMP traffic and the frequency with which firewalls, application servers and network routers appear as affected systems. This could help identify recurring relationships between attack types, network protocols and affected infrastructure.

The machine-learning findings suggest that Neural Network has the highest recorded detection proportion and average confidence score. However, further testing against independently verified attack outcomes would be necessary to evaluate the actual performance of each model and establish whether these differences are meaningful.

From an intelligence perspective, additional research into the recorded source countries could provide useful geographical context. However, source-country associations should be treated cautiously and should not be used as evidence of attribution without corroborating intelligence.

Finally, I would recommend obtaining a more complete dataset containing reliable timestamps, organisation or sector information, verified detection outcomes and more detailed port classifications. Combining these improvements with further OSINT research would support more detailed threat assessments and provide a stronger understanding of the cyberattack patterns represented in the dataset.

## Limitations

- **Geographical attribution:** Source countries are recorded in the dataset but cannot independently establish the identity or location of an attacker.
- **Organisation and sector information:** The dataset identifies affected system types but does not contain specific organisation names or industry sectors.
- **Destination ports:** All 98 UK-targeted records had unique destination ports, preventing the identification of frequently recurring ports.

## Previews

## Final Project

###### Original data will be linked
