

retrieve and start docker:

docker-compose -f <file-name.yml> up -d

after all has come up check that connect has started

docker logs connect

docker logs broker | Select-String -Pattern 'Started'


use postman to check connectors:

http://127.0.0.1:8083/connector-plugins

download connector:
https://debezium.io/documentation/reference/connectors/sqlserver.html
https://repo1.maven.org/maven2/io/debezium/debezium-connector-sqlserver/

copy the downloaded connector file to the container - here we plce it in /tmp

docker cp .\debezium-connector-sqlserver-1.5.0-20210220.001004-190-plugin.tar.gz connect:/tmp

spin up the bash shell in the connect container:

docker exec -it connect /bin/bash

check that the file is in tmp

cd /tmp
ls

in the container un-tar the file to the path it should be /usr/share/java

tar -xvf ./debezium-connector-sqlserver-1.5.0-20210220.001004-190-plugin.tar.gz -C /usr/share/java/





