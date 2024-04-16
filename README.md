# Final-IaC
Team members:
Brent Encarnado https://github.com/brentencarnado
Chowdhurysal Ferdowsy https://github.com/chowdhury611
Cameron Barber https://github.com/barb0238
Andrew Han https://github.com/han00116

## Define Resources
Created blob storage and container using Terraform
![Resource group](/infrastructure/pictures/1a.png)
![RG](/infrastructure/pictures/1b.png)
![RG](/infrastructure/pictures/1c.png)
![Storage](/infrastructure/pictures/1d.png)

Created a Terraform module for the AKS clusters
  - Created an AKS cluster in the `test` environment
    - 1 node
    - Standard B2s VM size
    - Kubernetes version 1.29.2
  - Created an AKS cluster in the `prod` environment
    - min 1 node
    - max 3 nodes
    - Standard B2s VM size
    - Kubernetes version 1.29.2
![code](/infrastructure/pictures/2a.png)

![App](/infrastructure/pictures/rbac.png)
Ensured the service principal specified in the Terraform configuration had the appropriate permissions. 

![code](/infrastructure/pictures/salehaapp.png)

Updated Terraform configuration with the newly generated credentials.
![App](/infrastructure/pictures/2e.png)
Then, I used 'terraform apply' and It worked
![App](/infrastructure/pictures/2b.png)
![App](/infrastructure/pictures/2c.png)
![prod](/infrastructure/pictures/2d.png)
![test](/infrastructure/pictures/test.png)

