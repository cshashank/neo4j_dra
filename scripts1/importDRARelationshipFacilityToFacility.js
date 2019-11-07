WITH "file:///dra_relationship_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (source:Facility {id: row.src})
MATCH (destination:Facility {id: row.dest})
MERGE (source)-[:COST {cost: toInteger(row.cost)}]->(destination)