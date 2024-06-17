#!/bin/bash

# Github Workflow API Endpoint
# Sample public github example used below: https://github.com/gerold/gatest/actions/workflows/getdate2.yml
GITHUB_WORKFLOW_ENDPOINT="https://api.github.com/repos/gerold/gatest/actions/workflows/75117523/runs"

# Output CSV file
OUTPUT_FILE="pipeline_job_summary.csv"

# Ask for Github Token to access the API.
echo -n Github Token: 
read -s github_token

# Query the pipeline data for the status of Workflow runs. This will gather the status of each run for a given Workflow.
# This is specific to Github.com Actions API https://docs.github.com/en/rest/actions?apiVersion=2022-11-28
# Gather only the value for "ID, Status, Conclusion" from Workflow runs. This can be customized depending on which values are needed or relevant such as failure reasons.
curl --header "Authorization: Bearer $github_token" $GITHUB_WORKFLOW_ENDPOINT | jq -r ' ."workflow_runs" | map({id, status, conclusion})' | jq -r '.[] | [.id, .status, .conclusion] | @csv' > /tmp/$OUTPUT_FILE

# Generate Output CSV file. Extract the third column (conclusion) as the distinct reason and count the value.
# Exclude "startup_failure" as a sample for reason to exclude from results, and would be the equivalent for given example "think_it_passed".
awk -F',' '$3 !~ /startup_failure/ {print $3}' /tmp/$OUTPUT_FILE | sort | uniq -c | awk '{print $2 "," $1}' > $OUTPUT_FILE

# Add header to the CSV file
sed -i '1iStatus,Occurrences' $OUTPUT_FILE

# Remove temp CSV file created during the process
rm /tmp/$OUTPUT_FILE

