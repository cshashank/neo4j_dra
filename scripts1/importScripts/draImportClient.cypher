WITH "file:///nodes/dra_clients_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(client: Client { id: row.id })
SET client.firstName = row.frist_name,
    client.lasttName = row.last_name
