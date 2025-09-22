# Wisecow DevOps Assignment

## Overview
This repository contains solutions for two problems:

1. **Problem 1:** Wisecow Application  
   - Containerized using Docker  
   - Kubernetes manifests included for deployment  
   - CI/CD workflow using GitHub Actions for automatic Docker image build  

2. **Problem 2:** Health Checker Scripts  
   - `system_health.py` monitors CPU, memory, and disk usage  
   - `app_health_checker.py` checks if the Wisecow application is running  

---

## Problem 1: Wisecow Application

### Running Locally with Docker
Build and run the Docker container:
```bash
docker build -t wisecow:latest .
docker run -p 4499:4499 wisecow:latest