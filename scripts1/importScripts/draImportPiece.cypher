WITH "file:///nodes/dra_pieces_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(piece: Piece { pieceId: row.piece_id })
SET piece.name = row.piece_name
SET piece.routeId = row.routeId
SET piece.routeMap = row.routeMap