# Final-IaC

Team members:
Brent Encarnado https://github.com/brentencarnado
Chowdhurysal Ferdowsy https://github.com/chowdhury611
Cameron Barber https://github.com/barb0238
Andrew Han https://github.com/han00116

## Define Resources

Created blob storage and container using Terraform
![Resource group](/infrastructure/Pictures/1a.png)
![RG](/infrastructure/Pictures/1b.png)
![RG](/infrastructure/Pictures/1c.png)
![Storage](/infrastructure/Pictures/1d.png)

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
    ![code](/infrastructure/Pictures/2a.png)

![App](/infrastructure/Pictures/rbac.png)
Ensured the service principal specified in the Terraform configuration had the appropriate permissions.

![code](/infrastructure/Pictures/salehaapp.png)

Updated Terraform configuration with the newly generated credentials.
![App](/infrastructure/Pictures/2e.png)
Then, I used 'terraform apply' and It worked
![App](/infrastructure/Pictures/2b.png)
![App](/infrastructure/Pictures/2c.png)
![prod](/infrastructure/Pictures/2d.png)
![test](/infrastructure/Pictures/test.png)

We got the Remix weather app working, but not deployed on the kubernetes cluster:
![1713238606984](image/README/1713238606984.png)

![1713238632700](image/README/1713238632700.png)
