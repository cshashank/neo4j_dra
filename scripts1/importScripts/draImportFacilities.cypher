WITH "file:///nodes/dra_facilities_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
CREATE(facility:M_Facility {facilityId:row.id})
SET facility.name = row.facility_name,
    facility.type = row.type,
    facility.lat = row.lat,
    facility.long = row.long,
    facility.supportedTasks = row.supported_tasks,
    facility.carriers = row.carriers
CREATE(iFacility:I_Facility)
SET iFacility=facility