# Terraform deployment
All resource groups and containers need to be created within a subscription. We have provisioned two resource groups, `rootsac2022q1edge-staging` and `rootsac2022q1edge-prod` for staging and production environments, respectively.

## Azure
To deploy the application to Azure with Terraform, the following steps are needed:
1) Create a Service Principal and store the ID's and secrets to GitHub secrets.
2) Create the Terraform backend resources manually on Azure.
3) Create the resources with the Terraform scripts. (either manually or by using the pipeline)
4) Deploying the code to the different resources: using the multiple GitHub actions CI/CD pipelines.

Store the following secrets in GitHub:
- client ID => AZURE_CLIENT_ID
- client secret => AZURE_CLIENT_SECRET
- subscription ID => AZURE_SUBSCRIPTION_ID
- tenant ID => AZURE_TENANT_ID

## Snowflake
To deploy the application to Snowflake with Terraform, the following steps are needed:
1) Create an ADMINUSER role and store its secrets to GitHub secrets.
2) Create the resources with the Terraform scripts. (either manually or by using the pipeline)
3) Deploying the code to the different resources: using the multiple GitHub actions CI/CD pipelines.

Store the following secrets in GitHub:
- account locator => SNOWFLAKE_ACCOUNT
- private key => SNOWFLAKE_PRIVATE_KEY
- region => SNOWFLAKE_REGION
- user => SNOWFLAKE_USER

e.g. 
```SNOWFLAKE_ACCOUNT = xy12345
SNOWFLAKE_REGION = north-europe.azure
SNOWFLAKE_USER = tf-snow
SNOWFLAKE_PASSWORD = <PUBLIC_KEY>
```
