WITH "file:///nodes/dra_carriers_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE(carrier: Carrier { id: row.id })
SET carrier.name = row.carrier_name
