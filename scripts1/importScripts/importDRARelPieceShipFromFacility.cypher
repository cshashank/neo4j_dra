WITH "file:///relationships/dra_rel_piece_ship_at_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (piece:Piece {pieceId: row.pieceId})
unwind split(row.shipFromFacilities,',') as legFacility
merge (lf:Facility {facilityId:legFacility})
MERGE (piece)<-[:SHIPPED {date: (row.date)}]-(lf)