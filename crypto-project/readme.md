🚀 Crypto Real-time Pipeline (Fabric & Spark Streaming)
      An end-to-end data engineering project built on Microsoft Fabric, utilizing Spark Structured Streaming and the Medallion Architecture to process real-time cryptocurrency data from the Binance API.

🏗️ Architecture
      Bronze (Raw): Ingests raw JSON via API and persists to Delta tables.
      
      Silver (Cleaned): Implements Streaming with Watermarking and Delta Merge (Upsert) to handle late-arriving data and enforce deduplication.
      
      Gold (Curated): Aggregates metrics (average/min/max price) for downstream BI analytics.

🛠️ Tech Stack & Key Features
      Engine: Spark Structured Streaming on Fabric.
      
      Storage: Delta Lake (ensuring ACID compliance and Schema Enforcement).
      
      Deduplication: Shifted from dropDuplicates to Delta Merge (Upsert) within foreachBatch to ensure idempotency across different compute sessions.
      
      Orchestration: Data Factory Pipelines with custom retry logic and session management.
      
      Optimization: Configured Custom Spark Pools and High Concurrency sessions to reduce cold-start latency.

📂 Project Structure
      01_Ingestion_Bronze.ipynb: API to Raw storage.
      
      02_Transformation_Silver.ipynb: Streaming, deduplication, and cleaning logic.
      
      03_Analytics_Gold.ipynb: Aggregation and business logic.
      
      samples/: JSON previews of data at each layer.

🚀 How to Use
      Import notebooks into a Microsoft Fabric workspace.
      
      Assign a Spark Pool.
      
      Orchestrate via a Data Factory Pipeline (Bronze -> Silver -> Gold).
