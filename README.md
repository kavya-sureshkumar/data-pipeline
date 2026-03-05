# data_pipeline

An Airflow + dbt pipeline using Astronomer, transforming TPC-H sample data in Snowflake.

## Stack

- **Airflow** (via Astronomer) — orchestration
- **dbt** — data transformation
- **Snowflake** — data warehouse (`snowflake_sample_data.tpch_sf1`)

## Project Structure

```
dags/
  dbt_dag.py              # Airflow DAG that runs dbt
  dbt/data_pipeline/
    models/
      staging/            # Views over raw TPC-H source tables
      marts/              # Intermediate and fact tables
    macros/               # Reusable SQL macros
    tests/                # Custom data tests
```

## Running Locally

```bash
astro dev start
```

Airflow UI: [http://localhost:8080](http://localhost:8080)
Postgres: `localhost:5432/postgres` — user: `postgres`, password: `postgres`
