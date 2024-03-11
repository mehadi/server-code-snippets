# Automated Website Deployment to cPanel with GitHub Actions: A Step-by-Step Guide

This GitHub Action automates the deployment of your website to a cPanel server using FTP.

## Prerequisites

Before using this GitHub Action, make sure you have the following:

- Access to a cPanel hosting account.
- FTP server address, username, and password for your cPanel account.
- Your website files ready in a GitHub repository.

## Usage

Follow these steps to set up automatic deployment to your cPanel server using GitHub Actions:

### Step 1: Configure cPanel

1. Log in to your cPanel account.
2. Navigate to the "FTP Accounts" or "File Manager" section.
3. Create a new FTP account if you haven't already.
4. Note down the FTP server, username, and password.

### Step 2: Set Up GitHub Repository Secrets

1. In your GitHub repository, go to "Settings" > "Secrets" > "New repository secret".
2. Add the following secrets:
    - `FTP_SERVER`: Set this to your cPanel FTP server address.
    - `FTP_USER`: Set this to your cPanel FTP username.
    - `FTP_PASS`: Set this to your cPanel FTP password.

### Step 3: Create GitHub Action Workflow

Create a `.github/workflows/deploy.yml` file in your repository with the following content:

```yaml
on:
  push:
    branches:
      - main
name: Deploy website on push
jobs:
  web-deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - name: Get latest code
      uses: actions/checkout@v4

    - name: Push files to cPanel
      uses: SamKirkland/FTP-Deploy-Action@v4.3.5
      with:
        server: ${{ secrets.FTP_SERVER }}
        username: ${{ secrets.FTP_USER }}
        password: ${{ secrets.FTP_PASS }}
```

### Step 4: Commit and Push

Once you've configured the GitHub Action workflow and set up the necessary secrets, you're ready to commit your changes and push them to your GitHub repository.

```bash
git add .
git commit -m "Add GitHub Action workflow for deployment"
git push origin main
```

### Step 5: Trigger Deployment

After pushing your changes, GitHub Actions will automatically trigger the deployment workflow whenever you push changes to the main branch. The workflow will execute the defined steps, including fetching the latest code and pushing it to your cPanel server via FTP.

### Additional Tips:

- Ensure that your cPanel server allows incoming connections on the FTP port.
- You may need to adjust the `main` branch to match your repository's default branch name if it's different.
- Make sure to replace `SamKirkland/FTP-Deploy-Action@v4.3.5` with the appropriate action if you're using a different one.

By following these steps, you can automate the deployment of your GitHub repository to your cPanel server using GitHub Actions.


Feel free to adjust the instructions as needed to fit your specific workflow and preferences!
