Terraform code just executed locally till plan, not complety tested on Azure.
It contains 5 modules :
1. Resource Group
2. Networking
3. VMscaleset - Front end VM cluster
4. Compute - Midlle layer (we can user cluster as per requirement)
5. databse - MySQL databse

secret.tfvars - File to store all the secrets.
plan_review.tfplan - Plan output




terraform plan -input=false -var-file="./dev.tfvars" -var-file="./secret.tfvars" -var="client_secret=<secret>" -out=plan_review.tfplan