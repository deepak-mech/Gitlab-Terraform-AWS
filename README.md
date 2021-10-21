## Problem Statement:

Create whole Network & Compute Infrastructure(VPC, Internet Gateway, Subnet, Route Table, Security Group, Key-Pair, EC2 Instance) on the top of AWS Cloud with the help of Terraform IAC Tool & deploy a php application in ec2 instance with Gitlab CI/CD Tool. Create S3 bucket to store the private key(.pem file) & .tfstate file for terraform.

## Solution:

1). Created a VPC (myvpc), Internet Gateway(myigw), Route Table(myRouteTable), Private Key(developer-key.pem), Security Group(mysg_php), Subnet(mysubnet) & EC2 Instance(php_app)  with the help of terraform automation tool.


2). Create a S3 bucket separately before uploading the private key & .tfstate file inside it.

3). Create gitlab personal token first from your gitlab account then use it inside gitlab provider configuration(provider.tf).

4). Gitlab will be responsible for the Continuous Integration & Continuous Deployment part.

5). AWS Secrets are stored in Gitlab Environment Variables.


### Files

variable.tf file  — consists of all the variables & their values.

main.tf  —  consist gitlab provider name & remote state(S3) to store .tfstate file.

provider.tf  —  consists terraform providers to download plugins & modules.

index.php  —  php application for deployment.

vpc.tf  —  consists code to launch network infrastructure.

securityGroup.tf  — create customize security group.

ec2-keyPair.tf  —  create private & public key & upload private key file into S3.

ec2.tf  —  launch an ec2 instance & store public ip of instance in gitlab environment variable.

gitlab-ci.yml  —  this file should be created in the root of repository & it is responsible to run the whole gitlab ci/cd pipeline.

php_app.yml  —  an extra yml file should be included in .gitlab-ci.yml used to deploy every change in php application.

