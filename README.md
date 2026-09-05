# AWS VPC + Load Balancer + Auto Scaling (Terraform) 🚀

Terraform use karke ek complete, scalable AWS infrastructure deploy kiya — custom VPC, Application Load Balancer, aur Auto Scaling Group ke saath. Traffic multiple EC2 instances me automatically distribute hota hai, aur load ke hisaab se instances khud scale in/out hote hain.

## 🛠️ Tech Stack
- **IaC Tool:** Terraform (HashiCorp) — v1.x
- **Cloud Provider:** AWS
- **Region:** us-east-1

## 📦 What Was Deployed

| Component | Details |
|---|---|
| VPC | Custom VPC, CIDR `10.0.0.0/16` |
| Subnets | 2 public subnets across 2 Availability Zones |
| Internet Gateway | Public internet access |
| Route Table | Routes public subnets to Internet Gateway |
| Security Groups | ALB SG (port 80), Instance SG (port 80 from ALB + SSH) |
| Launch Template | Amazon Linux 2023, Nginx auto-installed via user_data |
| Auto Scaling Group | Min: 1, Desired: 2, Max: 3 |
| Application Load Balancer | Distributes traffic across instances |
| CloudWatch Alarms | Scale-out at CPU > 70%, scale-in at CPU < 20% |

## 📂 Project Structure
```
.
├── main.tf          # VPC, subnets, ALB, ASG, launch template, scaling policies
├── variables.tf      # Input variables
├── outputs.tf        # ALB URL, VPC ID, ASG name
└── .gitignore
```

## ⚙️ How to Run
```bash
terraform init
terraform plan
terraform apply
```

Output me milega `alb_dns_name` — usi URL ko browser me kholo. Refresh karte raho, ALB alag-alag instances pe traffic bhejega (load balancing ka proof).

Cleanup karne ke liye:
```bash
terraform destroy
```

## 📖 What I Learned
- VPC networking fundamentals — subnets, route tables, internet gateway
- Application Load Balancer aur target groups
- Auto Scaling Groups aur launch templates
- CloudWatch alarms se metric-based scaling policies

## 🔮 Next Steps
- Private subnets + NAT Gateway (secure architecture)
- RDS database in private subnet
- HTTPS via ACM certificate + Route 53 domain

---
**Author:** Lokendra Pandit
