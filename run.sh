#!/bin/bash
# Trigger the scripts that gather pipeline data and generate chart.

# Run script to get pipeline data
echo "Running pipeline_job_summary.sh"
/bin/bash pipeline_job_summary.sh

# Install requirements and run python script for generating chart
echo "Installing Python dependencies"
pip install -r requirements.txt
echo "Running pipeline_job_summary.py"
python pipeline_job_summary.py

echo "Script execution completed."
