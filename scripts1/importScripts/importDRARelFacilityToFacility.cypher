WITH "file:///relationships/dra_rel_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin1:M_Facility {facilityId: row.src})
MATCH (destination1:M_Facility {facilityId: row.dest})
MATCH (origin:I_Facility {facilityId: row.src})
MATCH (destination:I_Facility {facilityId: row.dest})
MERGE (origin)-[:ECOST {cost: toInteger(row.cost)}]->(destination)
MERGE (origin1)-[:ECOST {cost: toInteger(row.cost)}]->(destination1)