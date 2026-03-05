import os
from datetime import datetime
from cosmos import DbtDag, ProfileConfig, ProjectConfig, ExecutionConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping

PROJECT_CONFIG = ProjectConfig(
    dbt_project_path="/usr/local/airflow/dags/dbt/data_pipeline",
)

PROFILE_CONFIG = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",
        profile_args={
            "database": "dbt_db",
            "schema": "dbt_schema",
        },
    )
)

EXECUTION_CONFIG = ExecutionConfig(
    dbt_executable_path=os.environ.get("DBT_EXECUTABLE_PATH", "/usr/local/airflow/dbt_venv/bin/dbt"),
)

dbt_snowflake_dag = DbtDag(
    project_config=PROJECT_CONFIG,
    profile_config=PROFILE_CONFIG,
    execution_config=EXECUTION_CONFIG,
    operator_args={"install_deps": True},
    schedule="@daily",
    start_date=datetime(2026, 1, 1),
    catchup=False,
    dag_id="dbt_dag",
)