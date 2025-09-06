````markdown
# iac-multi-env-with-state-locking

Terraform-based **Infrastructure as Code (IaC)** project for provisioning **multi-environment AWS infrastructure** with:
- Remote state stored in **S3**
- State locking via **DynamoDB**

This ensures safe, consistent deployments across **Development**, **Staging**, and **Production** environments.

---

## 🚀 Features
- Automated creation of remote backend (S3 + DynamoDB)
- Separate state files for each environment
- EC2 instances, S3 buckets, and DynamoDB tables per environment
- Prevents concurrent modification with Terraform state locking
- Modular and reusable structure for different environments

---

## 📂 Project Structure
```bash
.
└── terraform
    ├── dev                                 # Development environment (2 EC2, S3, DynamoDB)
    │   ├── main.tf
    │   ├── providers.tf
    │   ├── terraform.tf
    │   └── variables.tf
    ├── devops-key
    ├── devops-key.pub
    ├── infra                               # Remote backend: S3 + DynamoDB for state locking
    │   ├── bucket.tf
    │   ├── dynamodb.tf
    │   ├── terraform.tfstate
    │   └── terraform.tfstate.backup
    ├── modules
    │   ├── dynamodb
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── ec2
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   └── s3
    │       ├── main.tf
    │       ├── output.tf
    │       └── variables.tf
    ├── prod                              # Production environment (3 EC2, S3, DynamoDB)
    │   ├── main.tf
    │   ├── providers.tf
    │   ├── terraform.tf
    │   └── variables.tf
    └── stg                               # Staging environment (2 EC2, S3, DynamoDB)
        ├── main.tf
        ├── providers.tf
        ├── terraform.tf
        └── variables.tf

````

---

## ⚙️ Prerequisites

* [Terraform >= 1.3](https://www.terraform.io/downloads)
* AWS CLI configured with proper IAM credentials
* An AWS account with permission to create:

  * EC2
  * S3
  * DynamoDB

---

## 🛠️ Usage

### 1. Provision Remote Backend (S3 + DynamoDB)

This step sets up the S3 bucket and DynamoDB table used for remote state and state locking.

```bash
cd infra
terraform init
terraform plan
terraform apply
# terraform destroy
```

### 2. Provision Development Environment

Creates **2 EC2 instances, 1 S3 bucket, and 1 DynamoDB table**.

```bash
cd dev
terraform init
terraform plan
terraform apply
# terraform destroy
```

#### terraform plan
<img width="1015" height="656" alt="dev_terraform_plan" src="https://github.com/user-attachments/assets/b5791524-849b-4e64-9baf-36ee621155e3" />

#### terraform apply
<img width="916" height="662" alt="dev_terraform_apply" src="https://github.com/user-attachments/assets/846cd1c0-7bc9-445c-945d-9ff7f3fa0279" />

#### EC2 Servers provisioned:
<img width="1897" height="873" alt="dev_ec2" src="https://github.com/user-attachments/assets/b1afa404-4b91-4baf-a882-50336d793d25" />

#### Security Group attached to both the servers and key-pair to allow ssh into both the servers:
<img width="1917" height="866" alt="dev_key-pair_sg" src="https://github.com/user-attachments/assets/b3487efa-062c-4008-828c-7951cda2cfcc" />

#### S3 bucket provisioned:
<img width="1899" height="860" alt="dev_s3" src="https://github.com/user-attachments/assets/a8b33cb7-9270-4b98-bfb6-290ebe284ab3" />


#### Dynamodb table provisioned:
<img width="1903" height="876" alt="dev_dynamodb" src="https://github.com/user-attachments/assets/9e5b82d9-17f7-4464-aca9-634ded1a05a0" />


### 3. Provision Staging Environment

Creates **2 EC2 instances, 1 S3 bucket, and 1 DynamoDB table**.

```bash
cd stg
terraform init
terraform plan
terraform apply
# terraform destroy
```
#### terraform plan
<img width="916" height="701" alt="stg_terraform_plan" src="https://github.com/user-attachments/assets/b54be82a-705e-4968-ace5-d2e251795450" />


#### terraform apply
<img width="972" height="741" alt="stg_terraform_apply" src="https://github.com/user-attachments/assets/f98b45e7-4503-4b14-a926-82159b264426" />

#### EC2 Servers provisioned:
<img width="1915" height="662" alt="stg_ec2" src="https://github.com/user-attachments/assets/27b4be25-1c69-4970-8449-4ec148319b69" />

#### Security Group attached to both the servers and key-pair to allow ssh into both the servers:
<img width="1918" height="662" alt="stg_key-pair_sg" src="https://github.com/user-attachments/assets/a7e7affb-135a-4929-9e46-41bc758d4450" />

#### S3 bucket provisioned:
<img width="1918" height="879" alt="stg_s3" src="https://github.com/user-attachments/assets/22a17122-0136-4710-be51-2e6016d2d999" />


#### Dynamodb table provisioned:
<img width="1906" height="662" alt="stg_dynamodb" src="https://github.com/user-attachments/assets/2306ab19-d3ce-4849-b88a-076cf18f00b7" />

### 4. Provision Production Environment

Creates **3 EC2 instances, 1 S3 bucket, and 1 DynamoDB table**.

```bash
cd prod
terraform init
terraform plan
terraform apply
# terraform destroy
```

#### terraform plan
<img width="976" height="745" alt="prod_terraform_plan" src="https://github.com/user-attachments/assets/461d2368-ffb4-46db-ba59-527a759341d1" />


#### terraform apply
<img width="978" height="738" alt="prod_terraform_apply" src="https://github.com/user-attachments/assets/ae57a900-9d7a-4141-92b8-2466311e7937" />

#### EC2 Servers provisioned:
<img width="1909" height="663" alt="prod_ec2" src="https://github.com/user-attachments/assets/50a80731-999f-43e4-8c7b-880281f4c7d2" />

#### Security Group attached to both the servers and key-pair to allow ssh into both the servers:
<img width="1915" height="686" alt="prod_key-pair_sg" src="https://github.com/user-attachments/assets/27f0c759-e8b1-49f1-9c4f-7fe2b7082de5" />

#### S3 bucket provisioned:
<img width="1883" height="475" alt="prod_s3" src="https://github.com/user-attachments/assets/56e37684-3e96-4568-b9e8-9ca36ad24f10" />


#### Dynamodb table provisioned:
<img width="1909" height="487" alt="prod_dynamodb" src="https://github.com/user-attachments/assets/cbe8b99c-f3df-4009-ad1d-29d8228d0b14" />

---

## 📊 Architecture

Below is the high-level architecture of the project:

* **Terraform** provisions infrastructure.
* **S3 + DynamoDB** ensure remote state management and locking.
* Separate workspaces for **Dev**, **Staging**, and **Prod** environments.

![Terraform Infra Animation](./assets/infra_animation.gif)

---

## 🛡️ State Locking Explained

Terraform uses:

* **S3 bucket** → Stores the Terraform state file remotely.
* **DynamoDB table** → Locks the state to prevent concurrent runs (avoiding corruption when multiple users run Terraform simultaneously).

---

## 📜 License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute with attribution.



