task1:

/home/automation/plays/ansible-task1/regular_tasks.yml 

playbook that runs on servers in the proxy host group and does the following:
A root crontab record is created that runs every hour.
The cron job appends the file /var/log/time.log with the output from the date command.

task2:

/home/automation/plays/ansible-task2/repository.yml

playbook that runs on servers in the database host group and does the following:
A YUM repository file is created.
The name of the repository is mysql80-community.
The description of the repository is “MySQL 8.0 YUM Repo”.
Repository baseurl is http://repo.mysql.com/yum/mysql-8.0-community/el/8/x86_64/.
Repository GPG key is at http://repo.mysql.com/RPM-GPG-KEY-mysql.
Repository GPG check is enabled.
Repository is enabled.

task3: 

/home/automation/plays/ansible-task3/roles/sample-apache

role called sample-apache that affect the webservers host group. The role satisfy the following requirements:
The httpd, mod_ssl and php packages are installed. Apache service is running and enabled on boot.
Firewall is configured to allow all incoming traffic on HTTP port TCP 80 and HTTPS port TCP 443.
Apache service should be restarted every time the file /var/www/html/index.html is modified.
A Jinja2 template file index.html.j2 is used to create the file /var/www/html/index.html with the following content:
The address of the server is: IPV4ADDRESS

task4:

/home/automation/plays/ansible-task4/haproxy.yml

playbook that runs on servers in the proxy host group and does the following:
Use geerlingguy.haproxy role to load balance request between hosts in the webservers host group.
Use roundrobin load balancing method.
HAProxy backend servers configured for HTTP only (port 80).
Firewall is configured to allow all incoming traffic on port TCP 80.

task5:

/home/automation/plays/ansible-task5/facts.yml

playbook that runs on hosts in the database host group and does the following:
A custom Ansible fact server_role=mysql is created that can be retrieved from ansible_local.custom.sample_exam when using Ansible setup module.

task6:

/home/automation/plays/ansible-task6/server_list.yml

playbook that does the following:
Playbook uses a Jinja2 template server_list.j2 to create a file /etc/server_list.txt on hosts in the database host group.
The file /etc/server_list.txt is owned by the automation user.
File permissions are set to 0600.
SELinux file label should be set to net_conf_t.
The content of the file is a list of FQDNs of all inventory hosts.
After running the playbook, the content of the file /etc/server_list.txt should be the following:
ansible2.hl.local
ansible3.hl.local
ansible4.hl.local
ansible5.hl.local
Note: if the FQDN of any inventory host changes, re-running the playbook should update the file with the new values.
