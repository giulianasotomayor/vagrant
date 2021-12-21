## _Running virtual machines with Vagrant - SysAdmin_
#
![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/vm_admin.png)

### Virtual machines
- vm1 wordpress
- vm2 elasticsearch

### Features
- Two vm with nginx in Ubuntu
- Public / Private network
- Port forwarding
- Extra disk

## Files
- Vagrantfile Script to run virtual machines;
![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/vm_admin.png)

- prosivion_wp.sh Install nginx, mariadb and php (virtual machine:wordpress)
- config_db.sh Create user, set up and add a database in MariaDB

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/mariadb_ddbb.png)

- config_php.sh Replace nginx set up in default file

- wordpress/wp_config.php Set up php and add mariadb user information
    ```java
    ** The name of the database for WordPress */
    define('DB_NAME', 'wordpress');

    /** MySQL database username */
    define('DB_USER', 'wordpressuser');

    /** MySQL database password */
    define('DB_PASSWORD', 'keepcoding');

    /** MySQL hostname */
    define('DB_HOST', 'localhost');

- install_wp.sh Download and set up wordpress<br>
    
    title="Sistema Sistema Sistema"<br> admin_user="keepcoding"<br> admin_password="keepcoding"<br> 
    admin_email="giu.sotomayor7@gmail.com"

<center> <img src="https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/pantalla_wp.png" height="320" width="250"> </center> 

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/dashboard_wp.png)

- provision_elk.sh Install nginx (virual machine: elasticshearch)

- install_elk.sh  Install Elasticsearch, Kibana and Logstash



- .gitignore

- readme.md

## Project status
- vm conection

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/ssh_vm.png)

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/ping_vm.png)

- Virtual machine: wordpress

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/filebeat_status_wp.png)

- Virtual machine: elasticsearch

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/logstash_status_es.png)

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/elasticsearch_status_es.png)

![](https://gitlab.com/gsotomayor/images_vm_vagrant/-/raw/main/kibana_status_es.png)

