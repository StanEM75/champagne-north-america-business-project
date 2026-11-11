# Champagne North America — Business Analytics

![Project Image](https://img-3.journaldesfemmes.fr/3B37Y-OvZSFN2LzQvhmANAakuMk=/1500x/smart/b127cd46868e4e0bac10211eaba038cc/ccmcms-jdf/27988869.jpg)

## Overview

Simulate a business analytics project for a French champagne retailer expanding into North America. Build a data transformation pipeline to analyze sales performance, identify seasonal opportunities, and support market adaptation in the United States and Canada.


## Tech Stack

| Technology | Purpose |
|---|---|
| ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white) | Data exploration, profiling and processing |
| ![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat&logo=pandas&logoColor=white) | Data manipulation and exploratory analysis |
| ![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=flat&logo=snowflake&logoColor=white) | Cloud data warehouse for SQL transformations |
| ![dbt](https://img.shields.io/badge/dbt-FB542B?style=flat&logo=dbt&logoColor=white) | Data transformation, modeling and quality tests |
| ![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white) | Exploratory data analysis |
| ![pytest](https://img.shields.io/badge/pytest-0A9EDC?style=flat&logo=pytest&logoColor=white) | Automated Python tests |

## Business Context

A French champagne retailer is expanding into the United States and Canada but faces several challenges:

- Limited visibility into sales performance across distributors.
- Incomplete and inconsistent commercial data.
- Limited understanding of local consumer preferences and seasonal demand.
- Logistics costs and distribution constraints affecting profitability.

The objective is to use data analytics to identify opportunities for improving sales performance and adapting the product offering to North American markets.

## Business Objectives

- **Sales performance:** Analyze sales trends across products, distributors and markets.
- **Seasonality:** Identify recurring events and periods associated with higher demand.
- **Market adaptation:** Understand product preferences and competitor trends.
- **Data quality:** Standardize fragmented datasets and improve data reliability.
- **Logistics:** Explore cost drivers and opportunities for supply chain optimization.

## Data Sources

The project uses synthetic datasets representing a champagne retailer operating in North America.

| Dataset | Purpose |
|---|---|
| **Sales** | Historical transactions across the United States and Canada (2023–2024) |
| **Product Catalog** | Champagne products, categories and pricing |
| **Distributors & Retailers** | North American distribution network |
| **Promotions** | Historical promotional campaigns |
| **External Events** | Holidays, festivals and events potentially influencing demand |
| **Market Top Sellers** | Proxy data describing competing products and market trends |
| **Logistics Costs** | Transportation, storage and import-related expenses |

## Data Pipeline Architecture

The project follows three main steps:

### 1. Data Exploration

- Explore datasets using Python, Pandas and Jupyter notebooks.
- Identify missing values, duplicates and inconsistent formats.
- Examine sales, product, distributor and external event data.

### 2. Data Transformation

- Use dbt to build SQL transformation models in Snowflake.
- Organize data into raw, intermediate and marts layers.
- Standardize data formats, remove duplicates and handle missing values.
- Apply dbt data quality tests, including uniqueness, non-null constraints and accepted values.

### 3. Business Analysis

- Analyze seasonal patterns in North American champagne sales.
- Identify events with high estimated sales impact.
- Explore product and competitor information to support business decisions.

## Data Modeling

The dbt project is organized into three layers:

| Layer | Purpose |
|---|---|
| **Raw** | Define and expose source datasets |
| **Intermediate** | Clean, standardize and transform business data |
| **Marts** | Produce analytical datasets for business reporting |

## Project Structure

- [`documentation/`](documentation/) — Business context, objectives and interview questions.
- [`exploration/notebooks/`](exploration/notebooks/) — Exploratory data analysis.
- [`exploration/data/`](exploration/data/) — Synthetic business datasets.
- [`exploration/packages/`](exploration/packages/) — Python utilities.
- [`exploration/tests/`](exploration/tests/) — Automated data exploration tests.
- [`transformation/transfos/models/`](transformation/transfos/models/) — dbt SQL transformation models.
- [`transformation/transfos/macros/`](transformation/transfos/macros/) — Reusable SQL macros.

*Personal project focused on analytics engineering, dbt, data quality and business intelligence in the North American market.*
