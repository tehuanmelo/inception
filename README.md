# Inception

## A Deep Dive into System Administration with Docker

This project delves into the world of system administration, specifically focusing on Docker containerization and Docker Compose orchestration. You'll construct a multi-service infrastructure within a virtual machine environment, honing your skills in both technologies and gaining valuable practical experience.

### Key Technologies

* **Docker:** Docker revolutionizes application deployment using containerization, encapsulating applications and dependencies for consistent and portable execution.

* **Docker Compose:** Docker Compose streamlines the management of multi-container applications, enabling easy definition, deployment, and scaling through a simple configuration file.

* **Virtual Machine (VM):** Virtual Machines emulate entire operating systems on a host server, providing isolation and flexibility for running multiple OS instances on a single physical machine.

## General Guidelines

- This project needs to be done on a `Virtual Machine`.
- All the files required for the configuration of your project must be placed in a srcs
folder.
- A `Makefile` is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using `docker-compose.yml`).
- This subject requires putting into practice concepts that, depending on your back- ground, you may not have learned yet. Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.


## Project Description
This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a `virtual machine`. You have to use `docker-compose`.
Each `Docker image` must have the same name as its corresponding service.
Each service has to run in a dedicated `container`.
For performance matters, the containers must be built either from the penultimate stable version of `Alpine` or `Debian`. The choice is yours.
You also have to write your own `Dockerfiles`, one per service. The Dockerfiles must be called in your `docker-compose.yml` by your `Makefile`.
It means you have to build yourself the Docker images of your project. It is then ***for- bidden to pull ready-made Docker images***, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).


### You then have to set up:
- A Docker container that contains `NGINX` with ***TLSv1.2*** or ***TLSv1.3*** only.
- A Docker container that contains `WordPress + php-fpm` (it must be installed and configured) only without nginx.
- A Docker container that contains `MariaDB` only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers. 
- Your containers have to restart in case of a crash.
- In your WordPress database, there must be two users, one of them being the ad- ministrator. The administrator’s username can’t contain admin/Admin or admin- istrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).
- To make things simpler, you have to configure your domain name so it points to your local IP address.
This domain name must be `login.42.fr`. Again, you have to use your own login.
For example, if your login is ***tde-melo***, `tde-melo.42.fr` will redirect to the IP address pointing to tde-melo's website.


### Project Structure:

```
.
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   └── tools
        │       ├── create_database.sh
        │       └── create_volumes.sh
        ├── nginx
        │   ├── conf
        │   │   └── nginx.conf
        │   ├── Dockerfile
        │   └── tools
        │       └── run_daemon.sh
        └── wordpress
            ├── Dockerfile
            └── tools
                └── install-wp.sh
```

## Usage
1. Clone the repository:
    ```bash
    git clone https://github.com/tehuanmelo/inception.git
    cd inception
    ```

2. Customize the `.env` file with your desired configurations:
    ```bash
    srcs/.env
    ```

3. Build and run the project using the Makefile:
    ```bash
    make
    ```
4. Access your services at.
    ```bash
    https://localhost
    ```
    in your preferred browser.

 5. To access the website with your domain name, it is necessary to modify the domain name in the .env file.  Additionally, ensure the inclusion of the same domain name in either the /etc/hosts file on your local machine or the virtual machine, if that is the platform in use.
    - change the DOMAIN_NAME in the .env file.
        ```bash
        # nginx config
        DOMAIN_NAME=tde-melo.42.fr
        KEY_=/etc/nginx/ssl/nginx.key
        CERT_=/etc/nginx/ssl/nginx.crt

        # mariadb config
        DB_NAME=wordpress
        DB_ROOT=root
        DB_USER=user
        DB_PASS=1234

        # wordpress config
        TITLE=inception_nightmare
        ADM_USER=wpadmin
        ADM_EMAIL=wpadmin@mail.com
        ADM_PASS=1234
        WP_USER=wpuser
        WP_USER_EMAIL=wpuser@mail.com
        WP_USER_PASS=1234
        ```
    - Open the hosts file
        ```bash
        nano /etc/hosts/
        ```
    - Add your domain name
        ```bash
        127.0.0.1       tde-melo.42.fr
        127.0.1.1       debian-12

        # The following lines are desirable for IPv6 capable hosts
        ::1     localhost ip6-localhost ip6-loopback
        ff02::1 ip6-allnodes
        ff02::2 ip6-allrouters
        ```
    - Access your services at.
        ```bash
        https://tde-melo.42.fr
        ```
        in your preferred browser.



