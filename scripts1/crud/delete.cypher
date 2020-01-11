match (p:Package {id:"package1"}) 
match (p)-[r:start]->(:Facility)
delete r

match (p:Package {id:"package1"}) 
match (p)-[r:DESTINATION_FACILITY]->(:Facility)
delete r
