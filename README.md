Cloud-Native Portfolio Website 🚀

http://skander-portfolio-bucket2026.s3-website-eu-west-1.amazonaws.com/

This repository hosts my personal portfolio website, deployed as a static site on AWS S3 with CloudFront CDN. It's a modern, responsive site built with HTML, CSS, JavaScript – and the real magic happens in the cloud infrastructure managed entirely with Terraform for Infrastructure as Code (IaC).

🌐 Cloud Integration & Deployment
Architecture Overview
text
Frontend (Static Site) → AWS S3 Bucket (Origin) → CloudFront CDN → Global Users
                           ↓
Terraform → Provisions & Manages Everything
                           ↓
GitHub → Source Control & CI/CD Trigger
AWS S3: Hosts the static website files (HTML/CSS/JS). Enabled static website hosting with public read access.

AWS CloudFront: Global CDN for low-latency delivery, HTTPS enforcement, and custom domain support (if configured).

AWS Route 53: DNS management for custom domain pointing (optional).

Terraform: Single .tf file defines the entire infrastructure – deployable in seconds.

Key Terraform Features Used:

AWS Provider configuration

S3 bucket with website hosting and CORS

CloudFront distribution with origin, behaviors, and SSL cert

IAM policies for secure access

Remote state in S3 for team collaboration

Deploy with Terraform (Live Demo)
bash
# Clone & navigate
git clone https://github.com/Skanderba8/my-portfolio
cd my-portfolio/infra

# Initialize & plan
terraform init
terraform plan

# Apply (creates S3 + CloudFront in ~2 mins)
terraform apply

# Access via CloudFront URL (output shows it)
terraform output website_url
Terraform File Structure:

text
infra/
├── main.tf          # S3, CloudFront, IAM
├── variables.tf     # Customizable vars (region, domain)
├── outputs.tf       # Website URL, bucket name
└── terraform.tfstate # State managed remotely
🛠️ Local Development
bash
# Install dependencies (if any JS frameworks)
npm install  # or yarn install

# Dev server
npm run dev  # http://localhost:3000

# Build for production
npm run build
🔧 Tech Stack
Frontend	Cloud	IaC & DevOps
HTML5, CSS3, JavaScript	AWS S3, CloudFront	Terraform
Responsive Design	Route 53 (DNS)	Git/GitHub
Vanilla JS	IAM Policies	Bash Scripting

This project demonstrates:

Static site hosting at scale (S3 + CloudFront = 99.99% uptime, global edge caching).

IaC best practices: Version-controlled infra, immutable deployments, zero-downtime updates.

Cost optimization: Serverless = ~$0.50/month for low traffic.

Security: HTTPS-only, least-privilege IAM, bucket policies.

CI/CD ready: Hook to GitHub Actions for auto-deploy on push.

Perfect for junior cloud engineers showing real AWS + Terraform skills beyond tutorials.

🚀 Quick Start for Your Own Portfolio
Fork this repo.

Edit index.html with your content.

Run terraform apply in /infra.

Update DNS → Done!

📞 Connect
LinkedIn

Email


Built with ☁️ AWS & ♻️ Terraform by Skander Ben Abdallah – Junior Cloud & Systems Engineer​
