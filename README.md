# TechNova Odoo 19 ERP – Cloud Deployment

## Project Overview -
TechNova is an ERP system developed using Odoo 19. The project was initially developed and tested on Odoo localhost. As part of the Cloud Deployment & ERP Migration task, the ERP was migrated from the Odoo database and deployed to the cloud. The application is deployed using Render, with PostgreSQL used as the database.

## Cloud Provider - The cloud provider we chose was Render. Render was selected because it provides a simple deployment process, Docker support, web services, and PostgreSQL hosting and also it was Oracle cloud i wanted to use but i couldn't access the payment information.

## Technologies Used
- Odoo 19
- PostgreSQL
- Docker
- GitHub
- Render
- Windows

## Deployment Architecture - The deployment consists of:
1. Odoo 19 application running as a Docker Web Service on Render.
2. PostgreSQL database hosted on Render.
3. GitHub repository containing the Docker configuration.
4. Render connecting the Odoo application to the PostgreSQL database.

## Docker Configuration - The project uses the official Odoo 19 Docker image. The Dockerfile configures Odoo to listen on Render's web service port.

```dockerfile
FROM odoo:19.0

EXPOSE 10000

CMD ["odoo", "--http-interface=0.0.0.0", "--http-port=10000"]



## Environment Variables
The following environment variables were configured in Render:
1) HOST – PostgreSQL database host
2) PORT – Render web service port (10000)
3) PGPORT – PostgreSQL port (5432)
4) USER – PostgreSQL database user
5) PASSWORD – PostgreSQL database password
Sensitive credentials are stored in Render Environment Variables and are not included in this repository.

## Database Migration 
The original Odoo database was backed up from the Odoo backup manager. The Odoo backup contained:
1) PostgreSQL database dump
2) Odoo filestore
3) Backup manifest
The PostgreSQL database dump was restored into the PostgreSQL database hosted on Render. After restoration, the database was verified and the Odoo modules and existing project data were confirmed to be available on the cloud deployment.

## Deployment Steps - 
Step 1 – Create GitHub Repository
A GitHub repository named odoo19-technova was created to store the deployment configuration.

Step 2 – Create Dockerfile
A Dockerfile based on the official Odoo 19 image was added to the repository.

Step 3 – Create Render PostgreSQL Database
A PostgreSQL database was created on Render in the same region as the Odoo web service.

Step 4 – Create Render Web Service
The GitHub repository was connected to Render and deployed as a Docker Web Service.

Step 5 – Configure Environment Variables
The Odoo application was connected to the Render PostgreSQL database using environment variables.

Step 6 – Restore Database
The local Odoo database backup was restored into the Render PostgreSQL database.

Step 7 – Fix Port Configuration
During deployment, Render initially failed to detect the application because the PORT variable was being used incorrectly.
The configuration was corrected by using: PORT=10000 for the Odoo web service, PGPORT=5432 for PostgreSQL.
The Dockerfile was also configured to run Odoo on port 10000.

Step 8 – Verify Deployment
After redeployment, Render successfully started the Odoo application.
The existing Odoo data and modules were confirmed to be available on the cloud-hosted ERP.

Live ERP
Live URL: https://odoo19-technova.onrender.com

## Assessor Account - An assessor account was created in the Odoo system using the required assignment credentials. The password is intentionally not published in this public repository for security reasons.

## Challenges Encountered - 
1) Database Initialization Error -
The first deployment failed because the PostgreSQL database was empty and did not contain the required Odoo tables.
Solution: The local Odoo database backup was restored into the Render PostgreSQL database.

2) Port Configuration Error -
Render initially reported that it could not detect an open port because the application was using PostgreSQL port 5432 as the web service port.
Solution: The web service was configured to use port 10000 while PostgreSQL remained on port 5432.

3) Addons Path Warning -
Odoo reported a warning about an unavailable /mnt/extra-addons directory. This did not prevent the core Odoo application from running because the required existing modules and data were successfully restored.

## Deployment Result - The Odoo 19 ERP was successfully migrated from the local Windows environment to Render Cloud. The deployed system is accessible through the live URL and contains the existing Odoo data and modules from the local system.

