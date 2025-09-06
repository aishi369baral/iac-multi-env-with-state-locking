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
├── infra        # Remote backend: S3 + DynamoDB for state locking
├── dev          # Development environment (2 EC2, S3, DynamoDB)
├── stg          # Staging environment (2 EC2, S3, DynamoDB)
└── prod         # Production environment (3 EC2, S3, DynamoDB)
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

```

---

✨ This README is structured, professional, and recruiter-friendly. All you’ll need to do is add your **animated GIF diagram** in `./assets/infra_animation.gif` (or change the path).  

Do you want me to also create a **short “Why this project matters” section** (like real-world use cases) to make it even stronger for your resume?
```

