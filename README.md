[![maintained by dataroots](https://img.shields.io/badge/maintained%20by-dataroots-%2300b189)](https://dataroots.io)

![dataroots.png](assets/dataroots.png)

# Terraforming Snowflake 
Part of [Weather Nowcasting](https://dataroots.ghost.io/weather-nowcasting/) - Weather prediction on an NVIDIA jetson with a CI/CD pipeline on the cloud
Shows how Terraform can be used to set up our Snowflake resources. On top of that, we present how to load the content of an Azure container into a Snowflake table. 

## General
This is part of the graduation project of the rootsacademy of March 2022. An application to predict weather up to 4 hours in the future based on measurements obtained from a sensor installed on the roof of Dataroots' building. These predictions will be based on real-time measurements of the temperature, humidity, pressure, light, sound and a camera pointed towards the sky. We also wanted to exercise building the CI/CD pipeline and connection between the edge device and the cloud.
More information can also be found [here](https://dataroots.ghost.io/weather-nowcasting/).

## Cloud architecture

Here's an overview of our cloud architecture:
- Provisioning the required resources and environments  
- Managing the flow of sensor data from the edge device into the IoT hub on Azure
- Connecting the IoT endpoint (blob container) to Snowflake using Azure Event Grid
- Managing the flow of images from the device into a blob storage container on Azure and from the storage container into the ML workspace
- Developing a CI/CD pipeline that automates the build and deployment of a model on an edge device

**Snowflake**
Each time sensor data gets collected into an Azure blob container, it’ll be stored on Snowflake with the same format. To create such a connection, we’ve provisioned an [Azure Event Grid](https://docs.microsoft.com/en-us/azure/event-grid/overview). So a notification gets sent to Snowflake and a new batch of data gets stored in its appropriate table.

**Edge & ML resources:**
- IoT hub, a central message hub for bi-directional communication between an IoT application and devices it manages
- storage account and a blob container within it to store the images sent from the device
- storage account and blob container within it to store the sensor data, receiving messages on a batch basis every 5 minutes
- One of the primary resources for the ML team is a *machine learning workspace*.
- *Azure Storage account* is used as the default datastore for the workspace. Jupyter notebooks that are used with your Azure Machine Learning compute instances are stored here as well. In our case, we've used the same storage account serving as an endpoint of the IoT Hub for our ML worksapce.
- Each Azure Machine Learning workspace has an associated Azure *Key-Vault* to manage secrets in the key vault including setting, retrieving, deleting, and listing secrets. 
- *Application Insights* is an application performance management service in Microsoft Azure that enables the capture, storage, and analysis of telemetry data from applications.
- Azure container registry is used to register docker containers that are used for machine learning environments when training and deploying models.

![architecture.png](assets/architecture.png)

## CI/CD actions
In this project we validate and plan our Terraform code as part of a Github workflow; more specifically, we execute the following 4 steps: 
- _Init_ command: ```terraform init -backend-config backend/staging.tfvars```
- _Format_ command: ```terraform fmt -check -recursive```
- _Validate_ command: ```terraform validate```
- _Plan_ command: ```terraform plan```

The above actions get triggered on a pull-request; whenever the pull-request is reviewed, approved and closed, a new workflow will run and everything gets executed in production: ```terraform apply -var-file vars/prod.tfvars```

## Prerequisites
- [Snowflake](https://www.snowflake.com/) account
- [Azure](https://azure.microsoft.com/en-us/) account

## Getting started
We explain everything in our [blog post](TBD). Briefly, you can do the following:
<ul>
  <li>Find out the Snowflake's account locator and region id</li>
  <li>Create RSA key</li>
  <li>Create service user for authentication to Terraform</li>
  <li>Set up the resources</li>
  <li>Grant access to storage containers</li>
  <li>Verify/apply changes</li>
</ul>

## Acknowledgements
Thanks goes to:
- [Frederik](https://github.com/frederikdesmedt), for his valuable code reviews/feedback


## Contact
- [Lidia](https://github.com/LidiaBaciu) lidia@dataroots.io
- [Bao](https://github.com/dbtruong) bao@dataroots.io
