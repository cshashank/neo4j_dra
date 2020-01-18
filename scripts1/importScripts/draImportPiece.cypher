WITH "file:///nodes/dra_pieces_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
unwind split(row.routeMap,',') as legFacility
merge (lf:LegFacility {facilityId:legFacility})
MERGE(piece: Piece { pieceId: row.piece_id })
SET piece.name = row.piece_name
SET piece.routeId = row.routeId
SET piece.routeMap = row.routeMap
