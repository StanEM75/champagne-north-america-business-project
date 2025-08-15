import pandas as pd

# Functions for data preparation
from packages.utils.data_exploration import find_primary_key, find_volumetry, find_number_of_unique_values_per_column

dic = {'date': [1,1,2,2], 'value':[4,4,4,4]}
df = pd.DataFrame(dic)

def test_find_number_of_unique_values_per_column():
    expected = {'date': 2, 'value': 1}
    result_df = find_number_of_unique_values_per_column(df)
    result_dict = result_df.iloc[0].to_dict()  # Convert DataFrame → dict
    assert result_dict == expected