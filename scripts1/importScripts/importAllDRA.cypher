match (n) detach delete n
WITH "file:///drpw_clients_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(client: Client { id: row.id })
SET client.firstName = row.frist_name,
    client.lasttName = row.last_name


WITH "file:///dra_node_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(facility: Facility { id: row.id })
SET facility.name = row.facility_name,
    facility.lat = row.lat,
    facility.long = row.long,
    facility.capacity = row.capacity,
    facility.processingTasks = row.processingTasks

WITH "file:///dra_relationship_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH(source: Facility { id: row.src })
MATCH(destination: Facility { id: row.dest })
MERGE(source) - [: COST { cost: toInteger(row.cost) }] -> (destination)

// update relationship initial cost 12, new 112

match(f1: Facility{ id: "fac002" }) - [r] - (f2: Facility{ id: "fac003" }) 
set r.cost=112 
return r
