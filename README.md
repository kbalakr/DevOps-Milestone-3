# M3 - Deployment
## Names:

- Bhushan Thakur (bvthakur)
- Kiran Krishnan Balakrishnan (kbalakr)
- Rohit Nambisan (rnambis)
- Vishal Kumar Seshagirirao Anil (vseshag)

## Screencasts
 
DevOps M3: Basic Deployment and Rolling update for iTrust: https://www.youtube.com/watch?v=H6W3EM6shXE

Basic Deployment and Canary release for Checkbox: http://www.youtube.com/watch?v=GnNZHOdFuFg

Infrastructure Upgrade(Nomad Clusters and Feature flag): https://youtu.be/l31tYYQYTfs

# Basic Deployment 
We created a bare repository called production using ``` git init --bare production ```. This was followed by creation of ``` post-receive ``` tailored for checkbox.io and iTrust. We also changed the execution permission for ``` post-receive ``` using ``` chmod +x post-receive ``` . For demonstration purpose, we created a file sample and pushed it to production repository. This process triggers the ``` post-receive ``` hook. The ``` post-receive ``` contains ansible script used for deploying the application.


# Infrastructure Upgrade
This part of the milestone was to upgrade infrastructure of checkbox.io application. The infastucture was made more reliable by implementing Nomad Clusters and deploying the application in them. Also feature flag was implemented using Redis Server. In the part of demonstration, a particular feature of checkbox.io, downloading user data of surveys, was enabled/disabled. Nomad clusters were implemented using two ansible scripts, one bringing up the droplets(DigitalOcean) and installing the dependencies for the same and the other script for installing and configurng Nomad cluster in the newly-created vms. For the feature flag, server.js was modified to accomadate redis toggle feature, which turns off/on the above mentioned feature.


# Canary Release
This part of the milestone was realized using a proxy javascript (proxy.js). The script is designed to redirect requests to production and canary servers both running an instance of checkbox.io on seperate droplets in the proportion of 80% and 20% respectively. The status of the canary is constantly monitored. When the canary server goes down, an alert is raised and subsequent requests are sent only to the production server. When the Canary server comes back up, another alert is raised, and requests are again sent in the ratio of 80-20 as before.


# Rolling Update
We initially deploy iTrust application on five different Virtual Machines on DigitalOcean using ansible script. The VM information like name, ip address and etc are stored in memory, using in memory ansible inventory. We use following ansible feature to iterate through all the instance in the inventory one by one.
```
serial: 1
```
For deployment part, we are removing the old repository and clonning the new repository again from the remote. Then we proceed to the regular installation of itrust, like we did in the basic deployment.


## Contributions

Nomad Cluster and Redis Feature Flag: Kiran Krishnan B and Rohit Nambisan

Basic Deployment of Checkbox and Canary Release: Vishal Kumar Seshagirirao Anil

Basic Deployment of iTrust and rolling updates: Bhushan Thakur
