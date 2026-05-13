# AdventureWorks DW 2022: End-to-End Data Engineering Pipeline

A comprehensive Data Engineering project built on the **Microsoft Fabric** ecosystem, demonstrating a robust Medallion Architecture (Bronze, Silver, Gold) with fully automated incremental loading from an on-premises SQL Server.

## 🏗️ Architecture & Data Flow
The project follows a modern data warehouse design to ensure scalability, data quality, and high performance:

1.  **Source:** On-premises SQL Server hosting the `AdventureWorksDW2022` database.
2.  **Ingestion (Bronze):** Data is extracted via **On-premises Data Gateway** and landed in a Fabric Lakehouse as **Delta Tables** in their raw format.
3.  **Transformation (Silver):** PySpark notebooks perform data cleansing, type casting, and incremental merging using **Upsert logic** to handle updates.
4.  **Modeling (Gold):** Data is structured into a **Star Schema** optimized for BI. Advanced `MERGE` operations are implemented to manage multi-line orders and historical data integrity.
5.  **Analytics:** A Power BI Dashboard connects directly to the Gold layer with an automated **Semantic Model Refresh** triggered by the pipeline.

## 🚀 Key Technical Implementation

### 1. Incremental Load
To optimize performance, the pipeline does not perform a full overwrite. Instead, it uses the Delta Lake `MERGE` command:
- **Silver Layer:** Joins on `SalesOrderNumber` and `SalesOrderLineNumber` to ensure record-level granularity.
- **Gold Layer:** Implements schema evolution with `overwriteSchema` and composite key matching to prevent duplicate rows in Fact tables.

### 2. Automated Orchestration
The entire workflow is managed by a **Fabric Data Factory Pipeline**:
- `Copy Data Activity` -> `Silver Notebook` -> `Gold Notebook` -> `Semantic Model Refresh`.

## 🛠️ Tech Stack
- **Platform:** Microsoft Fabric
- **Storage:** OneLake (Delta Lake format)
- **Processing:** PySpark (Fabric Notebooks)
- **Database:** SQL Server 2022 (Local)
- **BI Tool:** Power BI

## 📝 How to Validate the Pipeline
To demonstrate the **Incremental Load** capability:
1.  Run the following SQL on your local instance to simulate a new transaction:
    ```sql
    INSERT INTO [dbo].[FactInternetSales] (...) 
    VALUES ('SO_INCREMENT_TEST', ...);
    ```
2.  Trigger the **Fabric Pipeline**.
3.  Monitor the **Pipeline Run Logs** for success.
4.  Check the **Power BI Dashboard**; the 'Order Count' KPI will automatically increment without manual intervention.

