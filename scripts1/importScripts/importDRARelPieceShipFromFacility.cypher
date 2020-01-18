WITH "file:///relationships/dra_rel_piece_arrive_at_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (piece:Piece {pieceId: row.piece})
MATCH (facility:Facility {facilityId: row.facilityId})
MERGE (piece)<-[:SHIPPED_FROM {date: (row.date)}]-(facility)
