WITH "file:///relationships/dra_rel_client_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (client:Client {id: row.client})
MATCH (facility:Facility {id: row.facility})
MERGE (client)-[:BELONGS {rel: (row.relationship)}]->(facility)