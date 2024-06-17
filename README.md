<h1 align="center">SB Pipeline Job Status 👋</h1>

This script facilitates the aggregation of pipeline data, organizing entries by job status and status reason into a CSV format. It exports the compiled table as CSV file and produces an infographic (such as a pie chart) illustrating the distribution of results from CSV. Additionally, the script includes a unified process to fetch data from the pipeline API, aggregate results, and create the infographic using Python.

### Using the Scripts
 - Clone this repository
 - Update `pipeline_job_summary.sh` with the target Workflow API endpoint. Example config for this [Workflow](https://github.com/gerold/gatest/actions/workflows/getdate2.yml).
    `GITHUB_WORKFLOW_ENDPOINT="https://api.github.com/repos/gerold/gatest/actions/workflows/75117523/runs"`
 - Make sure `run.sh`, `pipeline_job_summary.sh`, and `pipeline_job_summary.py` scripts are executable.
 - Run `run.sh` and enter you Github Token to access the provided Workflow.

### Contents:
- `pipeline_job_summary.sh`: Downloads pipeline run status and generates a summary such as Success or Failure.
- `pipeline_job_summary.py`: Generate a pir chart for visualization of pipeline job status.
- `run.sh`: Triggers run of both pipeline job summary scripts
- `pipeline_job_summary.csv`: Downloaded summary of pipeline jobs
- `pipeline_job_summary.jpg`: Result pie chart for pipeline jobs. Sample below.  
![pipeline_job_summary](https://github.com/gerold/sbtest/assets/463994/267efe6b-b1bf-4335-9d02-8c393cd9b71a)

## Author

👤 **Gerold**
* Github: [@gerold](https://github.com/gerold)

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
