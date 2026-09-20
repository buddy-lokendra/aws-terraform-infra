AWS VPC + Load Balancer + Auto Scaling + EKS (Terraform) 🚀

A complete, production-style AWS infrastructure built using Terraform — featuring a custom VPC, Application Load Balancer, Auto Scaling Group, and a managed Kubernetes cluster (EKS). Traffic is automatically distributed across multiple EC2 instances, which scale in/out based on load, while the EKS cluster runs within the same VPC for containerized workloads.

🛠️ Tech Stack
IaC Tool: Terraform (HashiCorp) — v1.x
Cloud Provider: AWS
Region: us-east-1
📦 What Was Deployed
Component	Details
VPC	Custom VPC, CIDR 10.0.0.0/16
Subnets	2 public subnets across 2 Availability Zones
Internet Gateway	Public internet access
Route Table	Routes public subnets to Internet Gateway
Security Groups	ALB SG (port 80), Instance SG (port 80 from ALB + SSH)
Launch Template	Amazon Linux 2023, Nginx auto-installed via user_data
Auto Scaling Group	Min: 1, Desired: 2, Max: 3
Application Load Balancer	Distributes traffic across instances
CloudWatch Alarms	Scale-out at CPU > 70%, scale-in at CPU < 20%
EKS Cluster	Managed Kubernetes control plane on AWS
Node Group	Worker nodes (EC2) running Kubernetes pods
IAM Roles	Cluster role + Node role with required policies
📂 Project Structure
.
├── main.tf              # VPC, subnets, ALB, ASG, launch template, scaling policies
├── variables.tf         # Input variables
├── outputs.tf           # ALB URL, VPC ID, ASG name, EKS outputs
├── eks-iam.tf           # IAM roles for EKS cluster & nodes
├── eks-cluster.tf       # EKS cluster resource
├── eks-nodegroup.tf     # EKS worker node group
└── .gitignore
⚙️ How to Run
bash
terraform init
terraform plan
terraform apply

The output will include alb_dns_name — open this URL in your browser. Refresh a few times to see the Application Load Balancer distribute traffic across different EC2 instances.

Connect to the EKS cluster:

bash
aws eks update-kubeconfig --name devops-portfolio-cluster --region us-east-1
kubectl get nodes

Clean up all resources:

bash
terraform destroy
📖 What I Learned
VPC networking fundamentals — subnets, route tables, and internet gateways
Configuring an Application Load Balancer with target groups
Auto Scaling Groups and launch templates for elastic EC2 capacity
Metric-based scaling using CloudWatch alarms
Provisioning an EKS cluster with Terraform, including IAM roles for cluster and node authentication
🔮 Next Steps
Private subnets with NAT Gateway for a more secure architecture
RDS database deployed in a private subnet
HTTPS via ACM certificate with a custom domain through Route 53
Deploy a sample application on EKS using Helm

Author: Lokendra Pandit
