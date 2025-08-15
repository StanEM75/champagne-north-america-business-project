import pandas as pd
import numpy as np

# Function to retrieve the primary key in a dataframe
def find_primary_key(df: pd.DataFrame) -> list[str]:
    primary_keys = []
    for col in df.columns:
        if df[col].isnull().sum() == 0 and df[col].nunique() == len(df):
            primary_keys.append(col)
    return primary_keys

# Function to calculate the total number of rows in a dataframe
def find_volumetry(df: pd.DataFrame) -> int:
    return len(df)

# Function to calculate the number of unique values in each column of a dataframe
def find_number_of_unique_values_per_column(df: pd.DataFrame) -> pd.DataFrame:
    unique_values_per_column = dict()
    for col in df.columns:
        unique_values_per_column[col] = df[col].nunique()
    
    result_df = pd.DataFrame([unique_values_per_column])
    return result_df

# Function to calculate the % of cells that are null
def share_of_null(df: pd.DataFrame) -> float:
    return round(((np.sum(df.isna().sum())/(df.size))), 2)

# Function to calculate the number of unique values in each column of a dataframe
def share_of_null_within_columns(df: pd.DataFrame) -> pd.DataFrame:
    null_values_per_column = dict()
    for col in df.columns:
        null_values_per_column[col] = df[col].isna().sum()
    
    result_df = pd.DataFrame([null_values_per_column])
    return result_df

# Function to calculate the percentage of rows with at least one null value
def share_of_rows_with_null(df: pd.DataFrame) -> float:
    return (df.isna().any(axis=1).sum()) / len(df) * 100

# Function to calculate the percentage of columns with at least one null value
def share_of_columns_with_null(df: pd.DataFrame) -> float:
    return df.isna().any(axis=0).sum() / len(df) * 100


