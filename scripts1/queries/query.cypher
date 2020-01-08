match (:Client {id:'cl001'})-[:BELONGS]->(facility:Facility)
RETURN facility

MATCH p=(c:Client)-[r:BELONGS]->() 
where c.id='cl001'
RETURN p 
LIMIT 25

MATCH p=(c:Client)-[r:BELONGS]->() 
where c.id='cl001'
RETURN r 
LIMIT 25

MATCH p=()-->() 
RETURN p LIMIT 25

match p=(:Client )-[:BELONGS {id:'ca005'}]->(facility:Facility)
RETURN p
