WITH "file:///relationships/dra_rel_carrier_to_facility.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (carrier: Carrier {id: row.carrier})
MATCH (facility: Facility {id: row.facility})
MERGE (carrier) - [:USES {rel: (row.relationship) }] -> (facility)
