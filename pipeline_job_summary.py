# Create a simple pie chart for provided pipeline job summary file.

import pandas as pd
import matplotlib.pyplot as plt

# Load the CSV file into a DataFrame
data = pd.read_csv('pipeline_job_summary.csv')

# Extract the labels and counts
labels = data['Status']
counts = data['Occurrences']

# Create a pie chart
plt.figure(figsize=(8, 8))
plt.pie(counts, labels=labels, autopct='%1.1f%%', colors=['red', 'green'])
plt.title('Failure vs Success')
plt.savefig('pipeline_job_summary.jpg')
plt.show()
