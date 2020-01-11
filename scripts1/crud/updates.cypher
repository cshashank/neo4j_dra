// update relationship initial cost 12, new 112
match(f1: Facility{ id: "fac001" }) - [r] - (f2: Facility{ id: "fac002" }) 
set r.route="rc2f2" 
return r

match(c2: Client{ id: "cl002" })  
set c2.route="rc2f2" 
return c2

match(f1: Facility{ id: "fac001" })  
set f1.route="rc2f2" 
return f1

match(c1:Client) , (f1: Facility)
where c1.id = "cl002" and f1.id = "fac001" 
create (c1)-[r:BELONGS]->(f1)
return r

match(c1: Client{ id: "cl002" }) - [r:BELONGS] - (f1: Facility{ id: "fac001" }) 
delete r 

MATCH (n) 
where n.route="rc2f2"
RETURN n 
LIMIT 25



