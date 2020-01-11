match leg1=(c1:Client {id:'cl001'})-[:BELONGS]->(fl1:Facility)
match leg=(fl1)-[:COST]->(fl2:Facility)
RETURN c1,leg

match st=(p1:Package {id:'package1'})-[:start]->(fl1:Facility)
RETURN st


match fl=(:Facility)-[:COST]->() return fl

match fl=(:Facility)<-[:BELONGS]-() return fl

MATCH p=(c:Client)-[r:BELONGS]->() 
where c.id='cl001'
RETURN p 
LIMIT 25

match (p:Package {id:"package1"}) 
match r= (p)-[:SHIPPED_FROM]->(:Facility)
return r

match p=(:Client )-[:BELONGS {id:'ca005'}]->(facility:Facility)->[:BELONGS {id:'ca005'}]->(facility:Facility)
RETURN p

match (p:Package {id:"package1"})
with p
match shipFrom=(p)-[:SHIPPED_FROM]->(:Facility)
match shipTo=(p)-[:SHIPPED_TO]->(:Facility)
return p,shipFrom,shipTo