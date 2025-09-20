name: Docker Build and Test

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    # 1️⃣ Checkout the repository
    - name: Checkout code
      uses: actions/checkout@v2

    # 2️⃣ Set up Docker Buildx (for building Docker images)
    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2

    # 3️⃣ Build the Docker image
    - name: Build Docker image
      run: docker build -t wisecow:latest .

    # 4️⃣ Run the container and check logs
    - name: Run Wisecow container
      run: |
        docker run -d -p 4499:4499 --name wisecow_test wisecow:latest
        sleep 5
        docker ps
        docker logs wisecow_test
        docker stop wisecow_test
        docker rm wisecow_test
