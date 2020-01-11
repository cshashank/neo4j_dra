merge (n:Package {name:"package1", route:"rc2f2" })

match (p:Package {id:"package1"})
with p
match (f:Facility {id:'fac001'})
merge (p)-[r:SHIPPED_FROM]->(f)
return r

match (p:Package)
with p
match (f:Facility)
where p.name='package1' AND f.id='fac005'
merge (p)-[r:SHIPPED_TO]->(f)
return r