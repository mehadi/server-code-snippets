### Publicize S3 Bucket Objects

This script is designed to make all objects within an Amazon S3 bucket publicly readable. It accomplishes this by iterating through all objects in the specified bucket and updating their Access Control List (ACL) to allow public read access.

### Prerequisites

Before using this script, ensure you have the following:

1. **AWS CLI**: The script relies on the AWS Command Line Interface (CLI) being installed and configured on the system where the script will be executed. Make sure you have the AWS CLI installed and configured with appropriate permissions to access and modify the specified S3 bucket.
See this [configuring-aws-cli-for-digital-ocean-spaces](..%2Fconfiguring-aws-cli-for-digital-ocean-spaces) repository to setup AWS Cli.
### Usage

To use the script, follow these steps:

1. **Clone the Repository**: Clone or download the script from the repository where it is stored.

2. **Set Execution Permissions**: Ensure the script has execution permissions. You can set the permissions using the following command:
      ```bash
   chmod +x make_all_files_public.sh
   ```

3. **Run the Script**: Execute the script either by providing the bucket name as an argument or by running it interactively:

      ```bash
   ./make_all_files_public.sh
   ```
   If you choose not to provide the bucket name as an argument, the script will prompt you to enter it interactively.

4. **Monitor Progress:** The script will display progress as it processes each object in the bucket, updating you on the number of objects processed out of the total.


### Important Notes

**Caution:** Be cautious when making S3 objects publicly readable, as it allows anyone on the internet to access them. Ensure you only apply this to objects that are intended to be publicly accessible.

**Permissions:** Ensure the AWS credentials used by the AWS CLI have sufficient permissions to access and modify the specified S3 bucket and its objects.

**Feedback:** If you encounter any issues or have suggestions for improvement, please feel free to submit them via GitHub or other relevant channels.