
# 📊 Real-Time Data Streaming & Analytics Pipeline using Azure & Databricks

This project implements an **end-to-end streaming data pipeline** using **Azure services** such as Data Lake Storage, Databricks, and Synapse Serverless SQL. It reads simulated streaming data, cleans it using PySpark, stores it in Delta format, and registers the output as an external table for SQL querying via Synapse.

---

## 🚀 Project Flow

```mermaid
graph TD
    A[Simulate CSV Stream with Python Script] --> B[Upload to Azure Data Lake (ADLS Gen2)]
    B --> C[Ingest & Clean in Azure Databricks (Streaming + PySpark)]
    C --> D[Write Clean Data to ADLS as Delta Format]
    D --> E[Create Synapse SQL View for Reporting]
```

---

## 📁 Directory Structure

```
Streaming_adls/
│   ├── csv to adls.ipynb        # Python script to simulate streaming CSV uploads    
│   ├── Createview_query.sql   # SQL view for cleaned data
│   ├── streaming_adls.ipynb # Databricks notebook: autoloader + cleaning + Delta write
|   ├── README.md
```

---

## 🧪 Technologies Used

- **Azure Data Lake Storage Gen2 (ADLS)** – storage layer
- **Azure Databricks** – real-time ingestion, PySpark transformations
- **Structured Streaming + AutoLoader** – for ingesting data continuously
- **Delta Lake** – for optimized storage format and ACID transactions
- **Azure Synapse Analytics (Serverless SQL Pool)** – to query cleaned Delta files
- **Azure Data Factory / Synapse Pipeline** – to automate end-to-end pipeline

---

## 📌 Key Features

- ⏱️ **Streaming Data Simulation** using a Python script
- ⚙️ **Autoloader in Databricks** for real-time ingestion from ADLS
- 🧹 **Data Cleaning & Transformation** using PySpark
- 💾 **Delta Format Output** for efficient storage
- 🧮 **External Table in Synapse** pointing to clean Delta files
- 📊 **Synapse SQL View** for unified querying and reporting

---

## 🧼 Data Cleaning Steps

1. **Cast Types**: `id → Integer`, `salary → Integer`, `name → String`
2. **Drop malformed rows**: Handled using `_rescued_data`
3. **Drop nulls** in key columns (`id`, `name`, `salary`)
4. **Remove duplicates** based on `id`
5. **Fix name formatting**: `"name1"` → `"Name 1"`

---

## 🧬 Sample Output

After processing, the cleaned data is available in:

```sql
SELECT * FROM [dbo].[vw_cleaned_employee_data];
```

Via Synapse Serverless SQL Pool.

---

## 📚 How to Run

### 1. Simulate Stream Data
 scripts  'csv to adls_dbr.ipynb'
```

### 2. Ingest + Clean in Databricks

- Use the provided notebook in Databricks workspace: `streaming_adls.ipynb`

### 3. Create SQL View in Synapse

Run `Createview_query.sql` inside Synapse Studio.

---

## 🧠 Author

**Ravina Babal**  
MSc Data Science Student  
GitHub: [@ravina335](https://github.com/ravina335)

---
