WITH "file:///relationships/dra_rel_facToFac-byPiece.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(srcFacility:Facility {facilityId:row.src})
MERGE(destFacility:Facility {facilityId:row.dest})
Merge((srcFacility)-[:SHIPPED {shipped:row.relationship +' '+row.date}]->(destFacility))