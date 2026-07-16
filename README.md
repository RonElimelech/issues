./ansible.cfg - Main configurstion file of the project. 
Configures to the ansible the location of the inventory directory, 
Location of the roles directory, 
It cancels the ssh key authectication checking , 
It cancels possible creation of retry file of the playbook in case of failure and it clears the output from possible python interpreter warnings. 

./deploy.sh - Main one-click-deployment script file of the project. it holdes script to run the playbook of the project in a simple way. it has exectuable premmisons.

./inventories/hosts.ini - inventory file of the project. holds the ip addresses of the macines divided into 3 groups: 'control' for the control node, 'proxies' for the proxy servers and 'webservers' fot the webservers. the proxy group have additional variables that configure for the keepalived template who is the MASTER and who is the BACKUP using state and priority value. in additon there are configurations that affects the every server like settings that relevant to the ssh connection and the name of the ansible-user.

./inventiories/group_vars/all.yml - global variables file that relevant to all machines. for example the ip of the virtual ip of the keepalived that the master server holdes . in addtions the domains are configured in this file and the webservers details that are relevant to all machines.

./playbooks/site.yml - playbook file of the project. it runs all roles in a logical order for the project to run properly. first it runs the common role to prepare the machines , then it runs the nginx role on the webservers and finally it runs the haproxy and keepalived roles on the proxies .

./files/certs/ - directory where it holds the certificate files of the project for the haproxy and nginx to display https properly.

./roles/common/ - role that runs on every machine. its purpose is to prepare the servers before configure its specific purpose. responsible for installing basic packages, start firewalld , add project host entries so every machine will know the other machine names,  installing the trusted root CA and update the trusted certificates collection.

./roles/nginx/  - role that runs only on the webservers.its purpose is to install nginx, copy the ssl certificate and send it to each html server and other configurations that are necessary to the webservers. the nginx is listening on port 443 , using the certificate that stored in /etc/nginx/certs/site.pem and display the files stored in /usr/share/nginx/html/index.html.

./roles/haproxy/ - role that is responsible to to configure and install the haproxy and it runs on the proxies. its purpose is to install haproxy , copy the certificates , set up the frontend https and more configurations that are relevant to the haproxy and the proxy servers.

./roles/keepalived/ - role that is responsible to to configure and install the keepalived which is to create high availablity between two haproxy servers when one master server (the default is proxy1) manages the vip adress 192.168.56.200 , and if it fails the vip moves to proxy2. the tasks it performs install and configure the keepalived so it will run properly on the proxies

./.gitignore - file that responsible to hold names of files that are not meant to be uploaded to the remote repo.
