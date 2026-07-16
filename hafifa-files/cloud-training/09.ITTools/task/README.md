### The task

Complete the task according to the DoD (Definition of Done) and all the best practices you've learned so far in Ansible and this chapter.

Use **Ansible** to achieve the following setup:

Two **HAproxy** servers that are part of a **Keepalived** cluster.
Each is used as a reverse proxy for two **Nginx** webservers _“ilovehafifa.com”_ and _“iloveclouds.com”_.

A client request is sent to the keepalived VIP and gets routed to the correct webserver based on the hostname it's meant for (re: illustration below).
All traffic must be HTTPS based and the browser should always show a secure connection.

The entire setup (proxies, keepalived, webservers..) needs to be done in Ansible, according to the best practices. Static content such as certificates or HTML pages can be generated in advance and not as part of the automation.

You can use the `/etc/hosts` file for name resoluton.
Upload the full automation to a repo for review with your tutor.

#### DoD
- Full, working Ansible automation uploaded to a repo
- Highly available keepalived config
- Different content according to requested hostname
- Trusted certificates
- *One-click deployment

*Your task will be reviewed by first deleting all the VMs you have (except the ansible control node). As such, your automation needs to be able to deploy all the task's services with a single run. Good luck!

#### Illustration

The client requests `https://ilovehafifa.com`, the proxy cluster redirects the request to the ilovehafifa.com Nginx server:
![alt text1][ilovehafifa]

The client requests `https://iloveclouds.com`, the proxy cluster redirects the request to the corresponding Nginx server:
![alt text1][iloveclouds]


[ilovehafifa]: ilovehafifa.png "ilovehafifa"  
[iloveclouds]: iloveclouds.png "iloveclouds"  
