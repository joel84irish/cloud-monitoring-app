# CI/CD Pipeline for Deploying a cloud-monitoring-app to Amazon ECS, with Terraform and GitHub Actions 

### This CI/CD workflow workflow includes steps for Terraform to deploy infastructure onto AWS such as VPC, subnets, Application load balncer, ECS cluster, task definition and service. Steps to check out the code, log into the ECR repository, build and push updated Docker images to ECR, then deploy the containerised application onto ECS, with a fully automated workflow.

We'll leverage AWS Elastic Container Registry (ECR) to store our Docker images, Amazon Elastic Container Service (ECS) to deploy our containerized website and Terraform as our infrastructure-as-code tool.I

incoperated key aspects of modern DevOps practices, including:
- Terraform allows me to maintain and version control my infrastructure configuration, enabling consistent and repeatable deployments.
- Continuous Integration and Continuous Deployment (CI/CD): The GitHub Actions workflow automates the build, test, and deployment processes, ensuring a smooth and efficient delivery pipeline. 
- Scalability and High Availability: Amazon ECS allows you to scale your containerized applications horizontally and deploy them across multiple Availability Zones for high availability. 
- Containerization Best Practices: By publishing and pushing Docker images, I embraced the portability and flexibility that containers provide, making deployments repeatable and reliable.
- Immutable Infrastructure: Deploying new versions of your application as immutable Docker images can ensure consistency and reliability across deployments.
- Extensibility: The pipeline setup is highly adaptable. With minimal adjustments, you can deploy applications to other container orchestration platforms like Kubernetes.

To run the Docker container, execute the following command:

```
docker run -p 5000:5000 cloud  
```

Navigate to [http://localhost:5000/](http://localhost:5000/) 
or use the load balancer DNS Name to access the application:

```
cloud-monitoring-1711878917.us-west-2.elb.amazonaws.com 
```

![image](https://github.com/user-attachments/assets/bbe78116-4373-4de7-bbf7-9c44bc236fb2)


![image](https://github.com/user-attachments/assets/399373fa-cf16-406f-b11d-d1db73317cae)



## Architecture diagram


![image](https://github.com/user-attachments/assets/6bb1baf0-cf06-49e3-bc3e-6b280fbc0fef)
