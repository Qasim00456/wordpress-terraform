# wordpress-terraform

# 🚀 WordPress on AWS EC2 using Terraform

This project automates the provisioning of a **WordPress site** on **AWS EC2** using **Terraform**. It sets up all necessary infrastructure components to get WordPress running in a highly available, configurable, and replicable way.



---

## 📦 Features

- ✅ Fully automated infrastructure provisioning with Terraform
- ✅ WordPress installed and configured on an EC2 instance (Amazon Linux / Ubuntu)
- ✅ MySQL database (local or RDS optional)
- ✅ Security groups for controlled access (SSH, HTTP, HTTPS)
- ✅ Key pair for SSH access
- ✅ Elastic IP for static public IP address
- ✅ User data script for automatic WordPress install
- ✅ Outputs for key infrastructure resources

---

## 🧰 Technologies Used

- **Terraform** (Infrastructure as Code)
- **AWS EC2** (Virtual server hosting WordPress)
- **AWS VPC** (Networking layer)
- **AWS Security Groups** (Firewall rules)
- **Amazon Linux 2** / **Ubuntu**
- **Apache / PHP**
- **MySQL / MariaDB** (local or external)

---

## 📁 Project Structure

terraform-assgnment/
├── module/
│ ├── ec2/ # EC2 resources (instance + variables)
│ └── vpc/ # VPC resources (network + security groups)
│
├── main.tf # Main Terraform configuration
├── provider.tf # Provider configuration (e.g., AWS)
├── var.tf # Global variables
├── outputs.tf # Global outputs
└── README.md # Project documentation

---

## 🚀 Getting Started

### ✅ Prerequisites

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) configured with IAM credentials
- [Terraform](https://www.terraform.io/downloads) v1.0+
- An AWS account
-

---

## 🔧 Configuration

1. **Clone this repository:**

```bash
git clone https://github.com/your-username/wordpress-ec2-terraform.git
cd wordpress-ec2-terraform
Customize variables:

Edit terraform.tfvars or pass values via CLI.

Example terraform.tfvars:

hcl
Copy code
region         = "us-east-1"
instance_type  = "t3.micro"
key_pair_name  = "my-key-pair"
public_key_path = "~/.ssh/id_rsa.pub"
Initialize Terraform:

bash
Copy code
terraform init
Preview infrastructure changes:

bash
Copy code
terraform plan
Apply and deploy:

bash
Copy code
terraform apply
Access WordPress:

Once deployment is complete, Terraform will output the public IP or DNS of the EC2 instance. Open it in your browser to complete the WordPress setup.

🧹 Teardown
To destroy all resources and avoid AWS charges:

bash
Copy code
terraform destroy
