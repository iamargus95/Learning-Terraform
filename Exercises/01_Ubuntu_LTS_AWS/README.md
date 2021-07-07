# Terraform config to create a server on AWS with Ubuntu LTS as the image.

I used AWS cli to configure my AWS setup. An Access key ID and a Secret access key are required while setting it up.
Here is a [guide](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) on how to do it.

Commands Used

1. `terraform init`

2. `terraform plan`

3. `terraform apply`
    
    After this command check the AWS webUI for a new instance. You should have a VM running Ubuntu LTS in the _**EC2 -> Instances**_ Section.

4. `terraform destroy`

    Execute this command to save your money. Nobody wants to give _you-know-who_ more money.