WITH "file:///relationships/dra_rel_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin:Facility {facilityId: row.src})
MATCH (destination:Facility {facilityId: row.dest})
MERGE (origin)-[:ECOST {cost: toInteger(row.cost)}]->(destination)