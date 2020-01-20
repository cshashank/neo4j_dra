WITH "file:///relationships/dra_rel_piece_arrive_at_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (piece:Piece {pieceId: row.pieceId})
unwind split(row.arrivedFacilities,',') as legFacility
MERGE (lf:Facility {facilityId:legFacility})
MERGE (piece)-[:ARRIVED {date: (row.date),cost:1000000}]->(lf)