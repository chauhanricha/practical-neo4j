unzip -q ./install/zulu11.39.15-ca-jre11.0.7-macosx_x64.zip
tar -xzf install/neo4j-enterprise-4.1.0-unix.tar.gz
unzip -q ./install/neo4j-graph-data-science-1.2.2-standalone.zip -d ./install

mv install/apoc-4.1.0.0-all.jar neo4j-enterprise-4.1.0/plugins
mv install/apoc-nlp-dependencies-4.1.0.0.jar neo4j-enterprise-4.1.0/plugins
mv install/apoc-mongodb-dependencies-4.1.0.0.jar neo4j-enterprise-4.1.0/plugins
mv install/neo4j-graph-data-science-1.2.2-standalone.jar neo4j-enterprise-4.1.0/plugins
