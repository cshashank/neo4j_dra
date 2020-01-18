WITH "file:///nodes/dra_facilities_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
UNWIND split(row.pieceIds,",") AS legPiece
MERGE(f:Facility {facilityId:row.id})
MERGE(p:Piece {pieceId:legPiece})
Merge((p)-[:ENTRY {arrivedAt:"1/4/2020"}]->(f))    