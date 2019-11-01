WITH "file:///C:/workspace/Neo4jDesktop/scripts/op2_client.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (client:Client {id:row.id})
SET client.firstName = row.frist_name,
	client.lasttName = row.last_name