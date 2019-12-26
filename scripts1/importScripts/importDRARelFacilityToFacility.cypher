WITH "file:///dra_relationship_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin:Facility {id: row.src})
MATCH (destination:Facility {id: row.dest})
MERGE (origin)-[:ECOST {cost: toInteger(row.cost)}]->(destination)