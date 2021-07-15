# Terraform config to create a server on GCP with Ubuntu LTS as the image.

To implement this exercise on GCP you need a free-tier account with $300 credit valid for 3 months. 

1. Once you do that create a new project and within it make a service account.

2. Generate a key for that service account in the JSON format and keep it in the same folder as [Exercise_01.tf](https://github.com/iamargus95/Learning-Terraform/blob/master/Exercises/01_Ubuntu_LTS_GCP/Exercise_01.tf). 

3. This file will give access to anyone into your project and should be included in the .gitignore file.

Commands Used

1. `terraform init`

2. `terraform plan`

3. `terraform apply`
    
    Check for a new compute instance on your project dashboard.

4. `terraform destroy`

    Execute this command to terminate the instance you just created.