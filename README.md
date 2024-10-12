### HELM CHARTS


Helm charts are a package management format used with Kubernetes to define, install, and manage applications. Helm acts like a package manager for Kubernetes, similar to how apt or yum works for operating systems. Here’s a detailed breakdown of what Helm charts are and how they function:

1. What is Helm?
Package Manager for Kubernetes: Helm helps you manage Kubernetes applications by providing an easy way to define, install, and upgrade complex Kubernetes applications.
Client-Server Architecture: Helm consists of a client (CLI tool) and a server-side component known as Tiller (though starting from Helm 3, Tiller is no longer required).
2. What is a Helm Chart?
Definition: A Helm chart is a collection of files that describe a related set of Kubernetes resources.
Directory Structure: A typical Helm chart has a specific directory structure:
bash
Copy code
mychart/
  ├── Chart.yaml          # Metadata about the chart
  ├── values.yaml         # Default configuration values for the chart
  ├── templates/          # Directory for Kubernetes manifest templates
  ├── charts/             # Subcharts (optional)
  └── README.md           # Documentation for the chart (optional)
3. Key Components of Helm Charts
Chart.yaml: Contains metadata about the chart, including its name, version, and description.
values.yaml: Provides default values for the chart's configuration. Users can override these values during installation.
templates/: Contains template files that define the Kubernetes resources (like Deployments, Services, ConfigMaps, etc.). Helm uses the Go templating language to render these files based on user-provided values.
charts/: A directory that can include other charts as dependencies.
4. Benefits of Using Helm Charts
Simplicity: Helm abstracts the complexity of Kubernetes manifests into a simpler package format.
Reusability: Charts can be reused and shared within teams or communities.
Versioning: Helm tracks versions of charts, allowing easy upgrades and rollbacks.
Customizable: Users can customize applications easily by modifying the values.yaml file or providing custom values during installation.
5. Common Helm Commands
Install a Chart:
bash
Copy code
helm install <release-name> <chart-name>
Upgrade a Release:
bash
Copy code
helm upgrade <release-name> <chart-name>
List Installed Releases:
bash
Copy code
helm list
Uninstall a Release:
bash
Copy code
helm uninstall <release-name>
6. Use Cases
Deploying Applications: Helm is commonly used to deploy web applications, databases, and other services to Kubernetes.
Managing Dependencies: Charts can define dependencies on other charts, making it easier to manage multi-tier applications.
Continuous Integration/Continuous Deployment (CI/CD): Helm can be integrated into CI/CD pipelines to automate application deployment.
Conclusion
Helm charts provide a powerful way to manage Kubernetes applications by packaging all necessary configurations and resources into a single unit. They simplify the deployment and management of complex applications, making Kubernetes more accessible to developers and operators.

### 2. VALUES.YAML EXPLANATION

The YAML snippet you've provided is a Helm chart values file, typically named `values.yaml`. This file contains configuration values that will be used when deploying your application with Helm. Here's a breakdown of each section:

### 1. `replicaCount: 1`

- **Description**: This specifies the number of replicas (instances) of your application that should be running in the Kubernetes cluster.
- **In this case**: The value is set to `1`, meaning only one instance of the application will be deployed. This is useful for development or testing purposes. In a production scenario, you might increase this value to provide high availability and load balancing.

### 2. `image:`

This section contains configuration related to the Docker image used for the application.

#### - `repository: <your-dockerhub-username>/my-flask-app`

- **Description**: This specifies the Docker image repository where your application's Docker image is stored.
- **In this case**: Replace `<your-dockerhub-username>` with your actual Docker Hub username. The image is named `my-flask-app`.

#### - `tag: "latest"`

- **Description**: This specifies the version (tag) of the Docker image to use.
- **In this case**: The tag is set to `"latest"`, which means that Helm will pull the most recent version of the image tagged as `latest` from the specified repository.

#### - `pullPolicy: IfNotPresent`

- **Description**: This controls when the Kubernetes cluster should pull (download) the Docker image.
- **Options**:
  - `Always`: Always pull the image from the repository.
  - `IfNotPresent`: Pull the image only if it is not already present on the node.
  - `Never`: Never pull the image; it must be present on the node.
- **In this case**: The policy is set to `IfNotPresent`, which optimizes the deployment by not pulling the image if it's already available, thus saving time and resources.

### 3. `service:`

This section defines the configuration for the Kubernetes Service that will expose your application.

#### - `type: NodePort`

- **Description**: This specifies how the service should be exposed.
- **Types**:
  - `ClusterIP`: Exposes the service on a cluster-internal IP. This type is only reachable from within the cluster.
  - `NodePort`: Exposes the service on each Node’s IP at a static port (the NodePort). This makes it accessible from outside the cluster.
  - `LoadBalancer`: Creates an external load balancer (if supported by the cloud provider).
- **In this case**: The service is set to `NodePort`, allowing external traffic to access the Flask application.

#### - `port: 5000`

- **Description**: This specifies the port on which the service will be exposed.
- **In this case**: The service will listen on port `5000`, which is typically where Flask applications run.

### 4. `resources: {}`

- **Description**: This section is intended to specify resource requests and limits for the application.
- **Usage**:
  - `requests`: Minimum resources required by the container.
  - `limits`: Maximum resources allowed for the container.
- **In this case**: The section is empty (`{}`), indicating that no specific resource requests or limits have been defined. This can be useful for testing, but it's generally a good practice to specify them in production to ensure proper resource allocation and management.

### Summary

This `values.yaml` file defines the configuration for deploying a Flask application using Helm. It specifies the number of replicas, the Docker image to use, how the application should be exposed, and resource management. You would typically modify the `<your-dockerhub-username>` placeholder with your actual Docker Hub username before using this configuration.


### PORTS UNDERSTANDING

Your understanding of the port mappings is mostly correct. Let’s clarify the roles of each port mentioned in your LoadBalancer service output:

80: This is the port on which the LoadBalancer service listens for incoming traffic. Clients will access your application through this port (e.g., http://<LoadBalancer-IP>).

30918: This is the NodePort that is automatically assigned by Kubernetes when you create a service of type NodePort. It allows you to access your application from outside the cluster via any of the nodes in the cluster, on that port. The NodePort is mapped to the LoadBalancer port.

5000: This is the containerPort specified in your Flask application, indicating the port on which the Flask app is running inside the container. When you set up the Service, you usually map the targetPort (in your case, 5000) to the port (in this case, 80).

Summary
80: Port for the LoadBalancer (external access).
30918: NodePort (used to access the service from any node in the cluster).
5000: ContainerPort (port on which your application is running inside the container).
So, your understanding is correct, and you can access your application either via the LoadBalancer's external IP (on port 80) or through any node's IP (on port 30918). If you have not specified the NodePort manually in your service definition, Kubernetes assigns a random port in the specified range (usually 30000-32767) for the NodePort.

## DEPLOYED APP USING HELM

![image](https://github.com/user-attachments/assets/6cb5ede4-f9f4-4496-a984-421d45a71281)







