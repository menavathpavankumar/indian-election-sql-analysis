🇮🇳 Indian General Elections 2024 – SQL Analysis

->Project Overview

This project analyzes the Indian General Elections 2024 dataset using MySQL.
It focuses on extracting meaningful insights such as seat distribution, alliance performance, candidate rankings, and voting patterns.

->Tools & Technologies

* MySQL (SQL queries, joins, aggregations, window functions)
* Excel (data preprocessing)
* GitHub (project hosting)

->Dataset Description

The dataset consists of the following tables:

* `constituencywise_results` – constituency-level results
* `constituencywise_details` – candidate-level vote details
* `partywise_results` – party performance
* `statewise_results` – mapping constituencies to states
* `states` – state information

->Key Analysis Performed

1. Total Seats Analysis:

* Total number of constituencies
* Seats available per state

2. Alliance Performance:

* Seats won by NDA, I.N.D.I.A, and OTHER alliances
* State-wise alliance dominance

3. Candidate Analysis:

* Winner and runner-up per constituency
* Top candidates by EVM votes

4. Voting Insights:

* EVM vs Postal vote distribution
* Total votes aggregation

->Key SQL Concepts Used:

* Joins (INNER JOIN, LEFT JOIN)
* Aggregations (SUM, COUNT)
* CASE statements
* Common Table Expressions (CTEs)
* Window Functions (ROW_NUMBER)

->Sample Insights:

* NDA secured the highest number of seats overall
* Significant variation in alliance performance across states
* Voting patterns differ between EVM and postal ballots

->Project Structure:

indian-election-sql-analysis/
│
├── queries/        # SQL scripts
├── results/        # Query outputs
├── dataset/        # CSV files
└── README.md


->How to Use:

1. Import dataset into MySQL
2. Run queries from `queries/indian_election_analysis.sql`
3. View outputs in `results/results.md`

->Author:

Menavath Pavan Kumar
