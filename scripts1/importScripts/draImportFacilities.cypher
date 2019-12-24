WITH "file:///dra_node_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(facility:Facility {id:row.id})
SET facility.name = row.facility_name,
    facility.lat = row.lat,
    facility.long = row.long,
    facility.capacity = row.capacity,
    facility.processingTasks = row.processingTasks