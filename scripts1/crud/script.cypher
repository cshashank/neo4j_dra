// find piece facility route - arrived
match (p:Piece {pieceId:"pa001"})
with p
match shipFrom=(p)-[:ARRIVED]->(:Facility)
return p,shipFrom

// find piece facility route - shipped
match (p:Piece {pieceId:"pa001"})
with p
match shipFrom=(p)-[:SHIPPED]->(:Facility)
return p,shipFrom

//slide 6 - analytics
//find all shipped and arrived
match sh=()-[:SHIPPED]-()
match ar=()-[:ARRIVED]-()
return sh,ar

// focus on specific piece 
// find piece facility route - shipped , arrived
match (p:Piece {pieceId:"pa001"})
with p
match shipFrom=(p)-[:ARRIVED]->(:Facility)
match shipTo=(p)-[:SHIPPED]->(:Facility)
return p,shipFrom,shipTo

//facility  stress
match pth=(f:Facility {facilityId:"f001"})-[]-(:Piece)
return pth
    

