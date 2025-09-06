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

### 4. Provision Production Environment

Creates **3 EC2 instances, 1 S3 bucket, and 1 DynamoDB table**.

```bash
cd prod
terraform init
terraform plan
terraform apply
# terraform destroy
```

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



