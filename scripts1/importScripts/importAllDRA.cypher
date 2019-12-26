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

// update relationship initial cost 12, new 112

match(f1: Facility{ id: "fac002" }) - [r] - (f2: Facility{ id: "fac003" }) 
set r.cost=112 
return r

match(c1:Client) , (f1: Facility)
where c1.id = "cl002" and f1.id = "fac001" 
create (c1)-[r:BELONGS]->(f1)
return r

match(c1: Client{ id: "cl002" }) - [r:BELONGS] - (f1: Facility{ id: "fac001" }) 
delete r 
