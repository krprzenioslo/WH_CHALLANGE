# Demo AWS infrastructure provisioning using terraform

**Option 4**

How to use:

Download the required plugins for provisioner to your local PC - Run command in downloaded source code directory:

**terraform init**

To start deploying architecture **use deploy.sh bash script** in your CLI with argument for **terraform** :

- plan
- apply
- destroy

Like this: source deploy.sh plan

Terraform will ask you to provide your access_key and secret_key for your AWS account.

You should edit the deploy.sh file and change value of variables:

**export TF_VAR_***

to meets your needs.

Explanation of them are comments inside the script.

