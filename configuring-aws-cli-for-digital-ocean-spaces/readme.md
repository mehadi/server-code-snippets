# Configuring AWS CLI for DigitalOcean Spaces

This guide will help you configure the AWS Command Line Interface (CLI) to work with DigitalOcean Spaces, enabling you to manage your object storage seamlessly.

## Prerequisites

Before you start, ensure you have the following:

- An active DigitalOcean account.
- Access to your DigitalOcean Spaces credentials (Access Key ID and Secret Access Key).

## Steps

1. **Install AWS CLI using pip:**
   Open your terminal or command prompt and run the following command:
   ```bash
   pip install awscli
   ```

2. **Configure AWS CLI:**
   
   Open your terminal and run the following command:
   ```bash
   aws configure
   ```
   You will be prompted to enter your Access Key ID, Secret Access Key, default region name, and default output format. Enter the required information. You can leave the default region name and default output format blank for DigitalOcean Spaces.


3. **Set Access Key ID and Secret Access Key:**

   You can set the Access Key ID and Secret Access Key by running:
   ```bash
   aws configure set aws_access_key_id YOUR_ACCESS_KEY_ID
   aws configure set aws_secret_access_key YOUR_SECRET_ACCESS_KEY
   ```
   Replace `YOUR_ACCESS_KEY_ID` and `YOUR_SECRET_ACCESS_KEY` with your DigitalOcean Spaces Access Key ID and Secret Access Key, respectively.
   
4. **Set Endpoint URL:**

   DigitalOcean Spaces requires a specific endpoint URL to interact with. Set the endpoint URL by running:
   ```bash
   aws configure set endpoint_url https://nyc3.digitaloceanspaces.com
   ```
5. **Verify Configuration:**
   
   You can verify the AWS CLI configuration by running:
   ```bash
   aws configure list
   ```
   Ensure that the Access Key ID, Secret Access Key, and Endpoint URL are correctly set.
6. **Test Connection:**
   
   To test the connection, you can run a simple command, such as listing the contents of your Space:
   ```bash
   aws s3 ls s3://your-space-name
   ```
   Replace `your-space-name` with the name of your DigitalOcean Space.

7. **Enjoy Using AWS CLI with DigitalOcean Spaces:**

   Your AWS CLI is now configured to work with DigitalOcean Spaces. You can use various AWS CLI commands to manage your objects in DigitalOcean Spaces seamlessly.