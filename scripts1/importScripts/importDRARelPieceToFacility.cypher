WITH "file:///relationships/dra_rel_piece_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (piece:Piece {pieceId: row.piece})
MATCH (facility:Facility {facilityId: row.facility})
WHEN   row.relationship="ARRIVED_AT"
THEN 
MERGE (client)-[:row.relationship {rel: (row.relationship)}]->(facility)
ELSE
MERGE (client)<-[:row.relationship {rel: (row.relationship)}]-(facility)
