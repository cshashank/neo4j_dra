Remove-Item -path C:\softwares\neo4j-community-3.5.3-windows\neo4j-community-3.5.3\import\*
Copy-Item C:\workspace\Neo4jDesktop\neo4J\copyToImportFolder\* -Destination C:\softwares\neo4j-community-3.5.3-windows\neo4j-community-3.5.3\import\ -Recurse -force
