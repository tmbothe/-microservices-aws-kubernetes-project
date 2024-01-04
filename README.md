# Coworking Space Service Extension

## Introduction

The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another.

This project simulates a DevOps engineer role who is collaborating with a team that is building an API for business analysts. The API provides business analysts basic analytics data on user activity in the service. The application they provide you functions as expected locally and you are expected to help build a pipeline to deploy it in Kubernetes.

### Dependencies
This project will be built locally, then apply to an AWS environment , therefore, the softwares below should be install locally, and an AWS account should be created.

#### Local Environment
1. Python Environment - run Python 3.6+ applications and install Python dependencies via `pip`
2. Docker CLI - build and run Docker images locally
3. `kubectl` - run commands against a Kubernetes cluster
4. `helm` - apply Helm Charts to a Kubernetes cluster

#### Remote Resources
1. AWS CodeBuild - build Docker images remotely
2. AWS ECR - host Docker images
3. Kubernetes Environment with AWS EKS - run applications in k8s
4. AWS CloudWatch - monitor activity and logs in EKS
5. GitHub - pull and clone code

### Setup
#### 1. Configure a Database
Set up a Postgres database using a Helm Chart.

1. Set up Bitnami Repo
Our project will be called **cowo-project** so, we first need to create a repos for it.
```bash
helm repo add cowo-project https://charts.bitnami.com/bitnami
```
2. Install PostgreSQL Helm Chart
```
helm install cowo-project cowo-project/postgresql
```
**3. Write a simple build pipeline with AWS CodeBuild to build and push a Docker image into AWS ECR.**
Using the  docker image generated above, we are going to create a repository in AWS to host our container. 
  **a. Screenshot of AWS CodeBuild pipeline.**

  ![codepipeline](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/codebuildpipeline.png)

  **b. Take a screenshot of AWS ECR repository for the application's repository**

  ![ecr](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/ecr_repository.png)

**4. Create a service and deployment using Kubernetes configuration files to deploy the application**
In this section, we will be creating a service and deployment using Kubernetes. The configuration file is included in this repository called ``` database.yaml```.

**5. You'll submit all the Kubernetes config files used for deployment (ie YAML files).**
For our AWS deployment, we will create a cluster with two subnets. Then two compute nodes with AMI ```AL2_ARM_64``` and instance type ```m6g.large ```
 Below are the different deployment output:
  **a. Screenshot of running the kubectl get svc command.**

   ![service](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/a_kubectl_get_services.png)

  **b. Screenshot of kubectl get pods.**

   ![pods](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/b_kubectl_get_pods.png)

  **c. Screenshot of kubectl describe svc <DATABASE_SERVICE_NAME>.**

   ![database](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/c_kubectl_svc_database_servicename.png)

  **d. Screenshot of kubectl describes deployment <SERVICE_NAME>.**

   ![servicename](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/d_deployment_servicename.png)

 **6. Checking AWS CloudWatch for application logs.**
    screenshot of AWS CloudWatch logs for the application 

   ![cpu](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/cpu.png)

   ![network](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/network.png)

   ![container](https://github.com/tmbothe/microservices-aws-kubernetes-project/blob/main/images/containerInsight.png)

