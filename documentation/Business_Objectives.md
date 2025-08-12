## ✂️ Problems to solve

**Low financial performance**
• Insufficient sales volumes
• Low profit margins

**Insufficient data collection**
• Some data is incomplete
• Some data is inconsistent

**Product offering not adapted to the market**
• Products identical to those offered in France
• No adaptation to local events

## 🎯 Objectives

**Improve data collection**
• Establish agreements with distributors to obtain detailed sales data (transactions, volumes, prices, promotions), either through payment or service exchange
• Define and apply data quality tests (primary key uniqueness, formats, missing values, consistency)
• Ingest data into a centralized system and implement a documented transformation pipeline

**Identify sales seasonality and events that influence sales**
• Precisely identify seasonality to determine the most favorable periods for sales
• Obtain external data on events that could positively influence sales and prepare targeted campaigns and offers for these events

**Understand consumer expectations**
• Identify the most popular products within our catalog
• Obtain data on the best-selling products in the North American market (spirits, wines, champagnes) from public databases or industry reports
• Adjust the product range to highlight high-performing items and reduce low-performing references

**Analyze logistics data to reduce associated costs**
• Identify the most costly steps (custom duties, maritime/air transport, storage)
• Propose adjustments to the supply chain (transport choice, shipment consolidation, warehouse selection)

## 🔢 KPIs to monitor

**Improve data collection**
• % of rows containing null values
• % of rows containing abnormal values
• % of rows not respecting standards

**Identify sales seasonality and influential events**
• Sales volume
>> Dimensions: Month, special events

**Understand consumer expectations**
• Sales volume within our catalog
>> Dimensions: Product categories, products
• Sales volume on the market
>> Dimensions: Product categories, products

**Analyze logistics data to reduce costs**
• Fixed costs per step
• Variable costs per step

## 💽 Required data

**Sales data from distributors at the individual transaction level if possible, or at least daily sales per product**
• *data/sales_distributors.csv*
• *data/distributors.csv*
• *data/product_catalog.csv*
• *data/retailers.csv*

**Promotion data from distributors at the individual promotion level, with associated products and promotion periods**
• *data/promotions.csv*

**External data on events driving sales in North America**
• *data/external_events.csv*

**External data on the most popular products in the North American spirits/wines/champagnes market, ideally segmented by country and state**
• *data/market_top_sellers_proxy.csv*

**Logistics data from logistics partners, including transport steps and associated costs**
• *data/logistics_costs.csv*