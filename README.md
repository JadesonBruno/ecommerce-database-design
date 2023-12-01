# E-Commerce Database Design 

[![License](https://img.shields.io/npm/l/react)](https://github.com/JadesonBruno/ecommerce-database-design/blob/main/LICENSE) 

## About the Project

This is a database project for an e-commerce scenario. The database was created to store information about customers, stocks, products, orders, suppliers and sellers (authorized stories).

The implementation of this project involved the transition from the Conceptual Model to the Logical Model, incorporating the use of the Enhanced Entity-Relationship Diagram (ERR).

I used the SQL language to create the database in the DBMS, MySQL, defining the entities and restrictions necessary for the model. Additionally, I populated the database with dummy data to allow queries using Data Query Language (DQL).

The project was a prerequisite for approval in the "Database Modeling and Logical Projects" module of the "Bootcamp Power Tech powered by [Ifood](https://www.ifood.com.br/) | Data Science" from the educational institution [DIO](https://www.dio.me/).

## Business Questions

Here are the business questions that can be answered using SQL queries:

- Where is a product located in stock?
- Which products are low in stock?
- What is the total sales revenue to customers in a given period?
- Which customers placed the most orders?
- Which suppliers have a specific product?
- Which authorized stores sell a specific product from our e-commerce?
- What are the most rated products?
- Which types of payments have the biggest requests?
- What is the total value in sales by payment type?
- Which orders are still in progress?
- Which customers have not placed any orders?



## Project development flowchart
![Project Development Flowchart](https://github.com/JadesonBruno/ecommerce-database-design/blob/main/assets/project_development_flowchart.png)

1. Requirements Analysis: This is the initial phase, where system requirements were collected and analyzed. This involves understanding what information the database should store, how the data will be used, and what operations should be supported.
2. Conceptual Model: the conceptual model was created that describes the entities, relationships and attributes of the system. The Enhanced Entity-Relationship Diagram (EER) was used for this purpose.
3. Logical Design: Based on the conceptual model, the database schema was designed. This includes defining tables, columns, primary and foreign keys, and other constraints.
4. Implementation: Here, the logical design has been mapped to a database management system (DBMS). The tables, relationships and constraints were created in the chosen DBMS (in this case, MySQL).
5. Data Loading: After mapping the schema to the DBMS, some fictitious data was loaded, in order to perform some queries and obtain some business insights.
6. Tests and Queries: some tests were carried out to observe the operation of the database and some queries were also carried out to answer some business questions.

## Conceptual Model
![Modelo Conceitual](https://github.com/JadesonBruno/ecommerce-database-design/blob/main/assets/ecommerce_eer_diagram.png)

## Technologies Used

- MySQL Server
- SQL
- MySQL Workbench
- Lucidchart

## How to execute the project

1. Run the creating_data_ecommerce_database.sql script against a supported database (e.g. MySQL, PostgreSQL) to create the database schema;
2. Run the inserting_data_ecommerce_database.sql script to insert data into the database;
3. Run the queries_data_ecommerce_database.sql script to perform the queries discussed.

## Contributions

Contributions are welcome! Feel free to suggest improvements or corrections to the project.

## Author

Jadeson Bruno Albuquerque da Silva

[![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jadeson-bruno-228450101/)

