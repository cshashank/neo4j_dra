//create leg
:params {"legName":"legF2F5","fac1":"fac002","fac2":"fac005"}
match (f1:Facility {id:$fac1})
match (f2:Facility {id:$fac2})
merge (leg:Leg {legId:$legName})
with  leg,f1,f2
merge (leg)-[startFrom:START_FROM]->(f1)
merge (leg)-[ends:ENDS]->(f2)

//add leg to route
:params {"legName":"legF2F5","routeName":"route3"}
match(route:Route {routeId:$routeName})
match(leg:Leg {legId:$legName})
with leg,route
merge (route)-[uses:USES]->(leg)




:params {"legName":"legF5F4","fac1":"fac002","fac2":"fac005"}
match (f1:Facility {id:"fac001"})
match (f2:Facility {id:"fac002"})
merge (package:Package {name:"package2", route:"rt2"})
merge (route:Route {routeId:"route3"})
merge (leg:Leg {legId:$legName})
with package,route,leg,f1,f2
merge (leg)-[startFrom:START_FROM]->(f1)
merge (leg)-[ends:ENDS]->(f2)
merge (route)-[uses:USES]->(leg)
merge (package)-[routesBy:ROUTES_BY]->(route)



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

