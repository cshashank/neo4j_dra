WITH "file:///relationships/dra_rel_piece_shipped_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (piece:Piece {pieceId: row.pieceId})
unwind split(row.shipFromFacilities,',') as legFacility
MATCH (lf:Facility {facilityId:legFacility})
MERGE (piece)-[:SHIPPED {date: (row.date),cost:1000000}]->(lf)