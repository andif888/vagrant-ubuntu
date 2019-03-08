# Terraform Azure Ubuntu

this repo spins up an Ubuntu 16.04 VM in Azure.

## Requirements
You need a Azure Subscription. If you have for example a Windows Azure MSDN Subscription you can easily use this. Running it for some hours cost only a few cents.  
You need Terraform installed. To install Terraform please checkout https://www.terraform.io/downloads.html  
You also need a service principal in Azure AD which has a contributor permission to your Azure Subscription.  
For that, you need to register a new App in Azure AD.  
Checkout [creating a Service Principal in the Azure Portal](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html) or the short instructions in [terraform.tfvars.sample](terraform.tfvars.sample).

## Using this repo

Rename or copy the [terraform.tfvars.sample](terraform.tfvars.sample) to `terraform.tfvars` and fill in your azure details and service principal details and also change the values to your needs.


to run terraform planing use:
```bash
terraform plan
```

to actually provision VMs in Azure run:
```bash
terraform apply
```

to destroy the whole deployment run:
```bash
terraform destroy
```
