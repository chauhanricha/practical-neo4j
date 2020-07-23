export neo4jVersion="4.1.1"
export apocVersion="4.1.0.1"
export gdsVersion="1.3.0"
export zuluVersion="11.41.23"
export jreVersion="11.0.8"

# changes to neo4j.conf file
echo "metrics.enabled=false" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.security.procedures.unrestricted=apoc.*,gds.*" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.default_listen_address=0.0.0.0" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.logs.query.enabled=off" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.memory.heap.initial_size=2048m" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.memory.heap.max_size=2048m" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.memory.pagecache.size=1g" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf
echo "dbms.tx_log.rotation.retention_policy=1G size" >> neo4j-enterprise-${neo4jVersion}/conf/neo4j.conf

# create apoc.conf file
echo "apoc.export.file.enabled=true" > neo4j-enterprise-${neo4jVersion}/conf/apoc.conf
echo "apoc.import.file.enabled=true" >> neo4j-enterprise-${neo4jVersion}/conf/apoc.conf

# setting the initial password
export JAVA_HOME=$(pwd)/zulu${zuluVersion}-ca-jre${jreVersion}-macosx_x64
export PATH=$JAVA_HOME/bin:$PATH
neo4j-enterprise-4.1.1/bin/neo4j-admin set-initial-password trinity
