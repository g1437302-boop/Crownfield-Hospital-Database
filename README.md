# Crownfield-Hospital-Database
Database system for Crownfield Eye Hospital. Includes normalized Schema(UNF to 3NF) , MySQL Queries, Procedure, Triggers, and Security configuration.
Crownfield Eye Hospital Database System
This repository contains the database design, DDL schema scripts, individual queries, stored procedures, triggers, and security configurations for the Crownfield Eye Hospital digital transformation project.
Required Repository Structure & File Execution Order
To set up and run the database correctly, execute the files in the following numerical order:
`01_schema.sql` – Creates the database and all related tables with primary and foreign key constraints.
`02_individual_queries.sql` – Contains individual SQL queries (joins, subqueries, and aggregate functions).
`03_procedure_and_trigger.sql` – Contains the stored procedure (Query 5) and database trigger (Query 6).
`04_security.sql` – Defines user roles, privileges, and access control matrices.
`05_ERD` – Contains the Entity-Relationship Diagram (Crow's Foot notation) illustrating database relationships.
________________________________________
Setup Steps
Clone or download this repository to your local machine.
Open your MySQL client (e.g., MySQL Workbench or Command Line).
Run the SQL files sequentially from `01_schema.sql` up to `04_security.sql`.
________________________________________
Assumptions Made for the Model
Every patient is assigned a unique Patient ID.
A clinician has one main specialty area but can conduct multiple appointments.
Each clinic location is managed independently.
An appointment can result in multiple diagnoses, prescriptions, or follow-up tasks.
