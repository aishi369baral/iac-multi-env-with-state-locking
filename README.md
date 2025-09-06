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
#### terraform plan
<img width="923" height="879" alt="infra_terraform_plan" src="https://github.com/user-attachments/assets/e62ea9d3-b813-418f-8470-96a884addf29" />

#### terraform apply
<img width="1791" height="1079" alt="infra_terraform_apply" src="https://github.com/user-attachments/assets/b82a4e27-f71f-4d7d-8658-883f19df99e0" />

#### S3 bucket provisioned to store remote state .tfstate files
<img width="1907" height="822" alt="infra_s3" src="https://github.com/user-attachments/assets/ed5eb8ac-a975-49a4-99ac-5c988bbdfc59" />
#### Dynamodb table for state locking provisioned
<img width="1916" height="564" alt="infra_dynamodb" src="https://github.com/user-attachments/assets/9b30766c-3b4d-4caf-9714-83842a4d5485" />


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

#### S3 bucket folders dev, stg, prod to store the .tfstate files of each environment separately:
<img width="1917" height="825" alt="remote_bucket_folders" src="https://github.com/user-attachments/assets/7f8e2f32-cdca-4971-a566-b80306cbaf2a" />

#### S3 bucket dev folder containing .tfstate file of dev environment
<img width="1907" height="711" alt="remote_bucket_dev" src="https://github.com/user-attachments/assets/de7aadb4-65bd-47de-b3c9-b0a7ff003d68" />
#### S3 bucket stg folder containing .tfstate file of stg environment
<img width="1918" height="718" alt="remote_bucket_stg" src="https://github.com/user-attachments/assets/0ec90615-10dd-462d-8db2-5449143def5a" />
#### S3 bucket prod folder containing .tfstate file of prod environment
<img width="1915" height="634" alt="remote_bucket_prod" src="https://github.com/user-attachments/assets/432ccdb7-3da6-45a8-8779-97d7ad526db5" />
#### Dynamodb table for state locking by lock id creation
<img width="1902" height="853" alt="remote_dynamodb_columns" src="https://github.com/user-attachments/assets/4f10359e-fc28-401d-8d32-5c5084906a0e" />

## 🛡️ Proof of State Locking

Terraform ensures **safe concurrent operations** by using a DynamoDB table for state locking.  
This prevents multiple users from applying changes to the same infrastructure at the same time.

- **User 1** runs `terraform apply` on the **Production environment** → acquires the lock successfully.  
- **User 2** also tries `terraform apply` on the **Production environment** → operation fails with an error since the lock is already held by User 1.  

This mechanism protects the infrastructure state file from race conditions and corruption.

### Example

✅ **User 1 acquires state lock on Production:**
<img width="1478" height="764" alt="lock_State_Example_user1_terminal" src="https://github.com/user-attachments/assets/6e5b5d6d-424d-4031-8948-172b7b568feb" />

❌ **User 2 blocked from applying Production infra due to state lock:**
<img width="1491" height="619" alt="lock_State_Example_Error_user2_terminal" src="https://github.com/user-attachments/assets/d71a3121-84c9-4f2a-8793-0b0a1e7eee4d" />


---

## 📜 License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute with attribution.



