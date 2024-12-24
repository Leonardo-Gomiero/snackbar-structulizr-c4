# Structurizr with C4 Model

This project utilizes the [C4 model](https://medium.com/@shubhadeepchat/the-c4-model-for-software-architecture-visualization-explained-93b85ea3e2e3) and the [Structurizr](https://structurizr.com) (Lite) tool, created by Simon Brown, the author of the C4 model.

## Getting Started

Follow the steps below to set up and run Structurizr locally using Docker.

### Prerequisites

- Ensure you have Docker installed on your system.

### Steps to Run Structurizr

1. **Download the Structurizr Docker Image**

   Pull the Structurizr Lite image from Docker Hub:

   ```bash
   docker pull structurizr/lite
   ```

2. **Run Structurizr**

    Execute the following command to run Structurizr Lite on port 8080:

    ```bash
    docker run -it --rm -p 8080:8080 --name structurizr-lite -v ~/Dev/Pos_Tech/structulizr:/usr/local/structurizr structurizr/lite
    ```
    - -p 8080:8080: Maps Structurizr Lite to port 8080 on your local machine.
    - -v ~/Dev/Pos_Tech/structulizr:/usr/local/structurizr: Mounts your local directory to the Structurizr working directory inside the container.

3. **Access Structurizr**

    Once the container is running, open [http://localhost:8080](http://localhost:8080) in your browser to access Structurizr Lite.