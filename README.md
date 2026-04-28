Here’s a **clean, production-quality README** tailored to what you actually built (not generic boilerplate). You can copy/paste this directly into your repo.

---

# ⚡ Energy Platform Rails

A production-style Ruby on Rails application deployed on AWS, designed to simulate infrastructure used in modern energy platforms.

This project demonstrates full-stack backend development, cloud infrastructure integration, and real-world debugging across networking, authentication, and deployment layers.

---

## 🚀 Overview

This application provides a Rails-based API and frontend backed by a MySQL database running on AWS RDS, with the application hosted on an EC2 instance and managed via systemd.

Architecture:

```
Browser → Rails App (EC2) → MySQL (RDS)
```

---

## 🧱 Tech Stack

### Backend

* Ruby on Rails 7
* MySQL (AWS RDS)
* ActiveRecord ORM

### Infrastructure

* AWS EC2 (application server)
* AWS RDS (managed MySQL database)
* Security Groups (network access control)
* systemd (process management)

### DevOps

* GitHub (source control)
* SSH deployment
* Environment-based configuration

---

## ⚙️ Features

* RESTful Rails application
* Database-backed models (Devices example)
* Production environment configuration
* External database connectivity (RDS)
* System-level service management (systemd)
* Debugged networking across VPC boundaries

---

## 🏗️ Deployment Architecture

```
EC2 Instance (Rails App)
│
├── systemd service (rails-app)
├── Puma / Rails server
│
└── Connects to:
     ↓
RDS MySQL Instance
```

---

## 🔧 Setup (Local Development)

```bash
git clone https://github.com/BronBron-Commits/energy-platform-rails.git
cd energy-platform-rails

bundle install

rails db:create
rails db:migrate

rails server
```

---

## ☁️ Production Setup (AWS)

### 1. Launch EC2

* Ubuntu instance
* Open ports: 22 (SSH), 3000 (app)

### 2. Install dependencies

```bash
sudo apt update
sudo apt install -y git build-essential libmysqlclient-dev

# Ruby via rbenv (already configured in your flow)
```

---

### 3. Clone and install

```bash
git clone https://github.com/BronBron-Commits/energy-platform-rails.git
cd energy-platform-rails
bundle install
```

---

### 4. Configure database

Edit:

```bash
nano config/database.yml
```

Example:

```yaml
production:
  adapter: mysql2
  encoding: utf8mb4
  database: energy_platform_production
  username: admin
  password: YOUR_PASSWORD
  host: YOUR_RDS_ENDPOINT
  port: 3306
```

---

### 5. Set environment variables

```bash
export RAILS_ENV=production
export SECRET_KEY_BASE=$(bundle exec rails secret)
```

---

### 6. Run migrations

```bash
RAILS_ENV=production bundle exec rails db:create
RAILS_ENV=production bundle exec rails db:migrate
```

---

### 7. Start server

```bash
RAILS_ENV=production bundle exec rails server -b 0.0.0.0
```

---

## ⚙️ systemd Service

Example service:

```ini
[Unit]
Description=Rails App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/energy-platform-rails
ExecStart=/home/ubuntu/.rbenv/shims/bundle exec rails server -b 0.0.0.0
Restart=always

Environment=RAILS_ENV=production
Environment=SECRET_KEY_BASE=your_secret
Environment=DATABASE_URL=mysql2://admin:PASSWORD@RDS_ENDPOINT:3306/energy_platform_production

[Install]
WantedBy=multi-user.target
```

---

## 🧠 Key Learnings

This project required solving real production issues:

* AWS VPC networking constraints
* RDS access control via Security Groups
* Public vs private database access tradeoffs
* MySQL authentication failures
* Rails environment configuration mismatches
* systemd environment propagation issues

These are common real-world failure points in production systems.

---

## 🔒 Security Notes

Current setup uses:

```text
RDS public access + open CIDR (0.0.0.0/0)
```

This is **intentional for development/demo purposes**.

### Production improvements:

* Move EC2 + RDS into same VPC
* Restrict DB access via security groups
* Remove public DB exposure
* Add IAM + secrets management

---

## 🧪 Future Improvements

* CI/CD pipeline (GitHub Actions → EC2 deploy)
* RSpec test coverage
* Background jobs (Sidekiq + Redis)
* S3 file storage integration
* CloudWatch logging
* Containerization (Docker + ECS/Fargate)

---

## 📈 Why This Project Matters

This project demonstrates:

* Full-stack Rails development
* AWS infrastructure usage
* DevOps ownership
* Debugging distributed systems

It aligns directly with roles requiring:

* Rails backend development
* AWS (EC2, RDS)
* MySQL
* Infrastructure troubleshooting

---

## 📄 License

MIT (or specify your choice)

---

## 👤 Author

Bronson Manley
GitHub: [https://github.com/BronBron-Commits](https://github.com/BronBron-Commits)

