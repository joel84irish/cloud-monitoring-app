# GitHub Actions CI/CD Pipeline for Deploying a cloud-monitoring-app to Amazon ECS

### Workflow OverviewThis CI/CD workflow workflow includes steps for checking out code, logging into the ECR repository, building and pushing Docker images, and deploying to ECS, with a fully automated workflow.

I incoperated key aspects of modern DevOps practices, including:

- Streamlined Build and Deployment: Leveraging GitHub Actions to automate the build, test, and deployment process ensures consistency and reduces manual intervention.
- AWS Integration: Configuring AWS credentials securely and deploying to Amazon ECS using task definitions allows for scalable, fault-tolerant applications.
- Containerization Best Practices: By publishing and pushing Docker images, I embraced the portability and flexibility that containers provide, making deployments repeatable and reliable.
- Extensibility: The pipeline setup is highly adaptable. With minimal adjustments, you can deploy applications to other container orchestration platforms like Kubernetes.




Navigate to [http://localhost:5000/](http://localhost:5000/) on your browser to access the application.


![image](https://github.com/user-attachments/assets/bbe78116-4373-4de7-bbf7-9c44bc236fb2)



## Architecture diagram

![image](https://github.com/user-attachments/assets/f2ec6095-6ece-4fe2-b24a-44b165db7e64)
