match (p:Package {id:"package1"}) 
match (p)-[r:start]->(:Facility)
delete r

match (p:Package {id:"package1"}) 
match (p)-[r:DESTINATION_FACILITY]->(:Facility)
delete r

match(p:Piece) delete p

match(f:Facility)
detach delete f

MATCH (n:Piece) WHERE NOT EXISTS (n.name) delete n

match(f:Facility {facilityId:"f001"}) where not ID(f)=48 detach delete f

match(:Facility)-[ec:ECOST]-(:Facility) delete ec