import pandas as pd

def find_primary_key(df: pd.DataFrame) -> list[str]:
    primary_keys = []
    for col in df.columns:
        if df[col].isnull().sum() == 0 and df[col].nunique() == len(df):
            primary_keys.append(col)
    return primary_keys

def find_volumetry(df: pd.DataFrame) -> int:
    return len(df)

def find_number_of_unique_values_per_column(df: pd.DataFrame) -> dict[str, int]:
    return {col: df[col].nunique() for col in df.columns}
