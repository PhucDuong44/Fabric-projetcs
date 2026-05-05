YouTube Data Pipeline (MS Fabric & PySpark)
An automated end-to-end data pipeline to ingest, transform, and visualize YouTube trends using Microsoft Fabric and PySpark.

🏗 Data Architecture
Built on a Medallion Architecture with a Star Schema output for optimized BI performance.

    Bronze: Raw JSON ingestion from SearchApi.io.
    
    Silver: Data cleaning, deduplication, and video classification (Shorts vs. Regular).
    
    Gold (Star Schema):
    
    Fact: gold_fact_performance (Views, Video Counts).
    
    Dim: dim_date, dim_keyword for efficient slicing.

🚀 Key Features
    Cost-Efficient Ingestion: Managed API quota by fetching top 100 results per keyword.
    
    Scalable Processing: Leveraged Spark on Fabric for high-speed transformations.
    
    Star Schema Design: Ensured 100% data consistency across Power BI visuals.

🛠 Tech Stack
    Orchestration: MS Fabric Pipelines.
    
    Engine: PySpark (Notebooks).
    
    Storage: Delta Lake.
    
    BI: Power BI (Direct Lake).
