import pandas as pd
import matplotlib.pyplot as plt

excel_file_path = 'C:\Users\AnasTahir\Downloads\data_challenge.xlsx'
df_user_data = pd.read_excel(excel_file_path, sheet_name='User Data')
df_week_total_purchases = pd.read_excel(excel_file_path, sheet_name='Week Total Purchases')

user_info_columns = ['cohort', 'has_first_name', 'has_last_name', 'has_verified_email', 'has_phone']
week_columns = ['week1', 'week2', 'week3', 'week4', 'week5', 'week6', 'week7', 'week8', 'week9', 'week10', 'week11', 'week12', 'week13', 'week14', 'week15']

user_info = df_user_data[['user_id'] + user_info_columns]
total_purchases = df_week_total_purchases[['userid'] + week_columns]

merged_data = pd.merge(user_info, total_purchases, left_on='user_id', right_on='userid')

correlation_matrix = merged_data.corr()

plt.figure(figsize=(12, 8))
plt.imshow(correlation_matrix, cmap='coolwarm', interpolation='none', aspect='auto')
plt.colorbar()
plt.xticks(range(len(correlation_matrix.columns)), correlation_matrix.columns, rotation='vertical')
plt.yticks(range(len(correlation_matrix.columns)), correlation_matrix.columns)
plt.title('Correlation Matrix - User Information and Total Purchases')
plt.show()
