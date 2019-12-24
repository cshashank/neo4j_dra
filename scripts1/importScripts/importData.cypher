WITH "file:///C:/workspace/Neo4jDesktop/scripts/op2_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (place:Place {id:row.id})
SET place.latitude = toFloat(row.latitude),
    place.longitude = toFloat(row.latitude),
    place.population = toInteger(row.population)