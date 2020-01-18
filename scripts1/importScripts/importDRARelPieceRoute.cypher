WITH "file:///relationships/dra_rel_piece_arrive_at_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin:Facility {facilityId: row.origin})
MATCH (destination:Facility {facilityId: row.destination})
MERGE (origin)-[:PIECE_ROUTE {pieceId:row.pieceId,legDate: row.date}]->(destination)