# Inception

## A Deep Dive into System Administration with Docker

This project delves into the world of system administration, specifically focusing on Docker containerization and Docker Compose orchestration. You'll construct a multi-service infrastructure within a virtual machine environment, honing your skills in both technologies and gaining valuable practical experience.


### Key Technologies

* **Docker:** Docker revolutionizes application deployment using containerization, encapsulating applications and dependencies for consistent and portable execution.

* **Docker Compose:** Docker Compose streamlines the management of multi-container applications, enabling easy definition, deployment, and scaling through a simple configuration file.

* **Virtual Machine (VM):** Virtual Machines emulate entire operating systems on a host server, providing isolation and flexibility for running multiple OS instances on a single physical machine.


## The base environment:

### Virtual Machine:
* Following the 42 school's guide to set up a virtual environment, the foundation of our project. I've choose Debian Bullseye as the base software with these apps installed:

    - `sudo` (Gatekeeper): Grants you access to control your system, like a wise advisor unlocking the right tools.

    * `ufw` (Firewall Guardian): Keeps your virtual city safe by filtering incoming and outgoing traffic, just like a watchful knight.

    * `docker` (Container Architect): Builds tiny, self-contained worlds (containers) for each service, ensuring smooth operation and resource efficiency.

    * `docker-compose` (Orchestrator): Like a conductor, docker-compose brings all your services together, ensuring they work in perfect harmony.

    * `make` (Automation Wizard): Waves its magic wand to automate repetitive tasks, saving you time and effort. 

### Project Structure:

```
|______ srcs
          |---------- docker-compose.yml
          |---------- .env
          |---------- requirements
                  |---------- tools
                  |---------- mariadb
                          |---------- conf
                          |---------- Dockerfile
                          |---------- .dockerignore
                          |---------- tools
                  |---------- nginx
                          |---------- conf
                          |---------- Dockerfile
                          |---------- .dockerignore
                          |---------- tools
                  |---------- wordpress
                          |---------- conf
                          |---------- Dockerfile
                          |---------- .dockerignore
                          |---------- tools
```

## Infrastructure:

### Services on Demand:
* Each service gets its own dedicated container, ensuring smooth operation and security:

    - NGINX, the secure gateway with TLSv1.3 encryption. 

    - WordPress + php-fpm, the dynamic duo powering your content management system. 

    - MariaDB, the reliable database engine for storing your precious data. 

### Volumes for Storage:
* Separate compartments are setted to store the WordPress data and website files.

    - `db-volume`, Store data from the MariaDB container.

    - `wp-volume`, Store the static files from the Wordpress container.


### Network Connection: 
* A dedicated Docker network `inception`, built with `docker-network`, is created to facilitates seamless communication.
### Always Up and Running:
* No worries about crashes! The containers are configured to restart automatically `always`, ensuring the infrastructure stays up and running.



