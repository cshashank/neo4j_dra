match (n) detach delete n

WITH "file:///nodes/dra_clients_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(client: Client { id: row.id })
SET client.firstName = row.frist_name,
    client.lasttName = row.last_name


WITH "file:///nodes/dra_node_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(facility: Facility { id: row.id })
SET facility.name = row.facility_name,
    facility.lat = row.lat,
    facility.long = row.long,
    facility.capacity = row.capacity,
    facility.processingTasks = row.processingTasks

WITH "file:///relationships/dra_rel_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH(source: Facility { id: row.src })
MATCH(destination: Facility { id: row.dest })
MERGE(source) - [: COST { cost: toInteger(row.cost) }] -> (destination)

//import rel client to facility
WITH "file:///relationships/dra_rel_client_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (client: Client {id: row.client})
MATCH (facility: Facility {id: row.facility})
MERGE (client) - [: BELONGS {rel: (row.relationship) }] -> (facility)