match (n) detach delete n

WITH "file:///nodes/dra_facilities_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(facility:Facility {facilityId:row.id})
SET facility.name = row.facility_name,
    facility.type = row.type,
    facility.lat = row.lat,
    facility.long = row.long,
    facility.supportedTasks = row.supported_tasks,
    facility.carriers = row.carriers

WITH "file:///nodes/dra_pieces_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
unwind split(row.routeMap,',') as legFacility
merge (lf:LegFacility {facilityId:legFacility})
MERGE(piece: Piece { pieceId: row.piece_id })
SET piece.name = row.piece_name
SET piece.routeId = row.routeId
SET piece.routeMap = row.routeMap

WITH "file:///nodes/dra_facilities_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
UNWIND split(row.pieceIds,",") AS legPiece
MERGE(f:Facility {facilityId:row.id})
MERGE(p:Piece {pieceId:legPiece})
Merge((p)-[:ENTRY {arrivedAt:"1/4/2020"}]->(f))    

WITH "file:///relationships/dra_rel_facility_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (origin:Facility {facilityId: row.src})
MATCH (destination:Facility {facilityId: row.dest})
MERGE (origin)-[:ECOST {cost: toInteger(row.cost)}]->(destination)

WITH "file:///relationships/dra_rel_facToFac-byPiece.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(srcFacility:Facility {facilityId:row.src})
MERGE(destFacility:Facility {facilityId:row.dest})
Merge((srcFacility)-[:SHIPPED {shipped:row.relationship +' '+row.date}]->(destFacility))