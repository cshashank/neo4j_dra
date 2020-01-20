Dijkstra algo

weighted

MATCH(source: Facility { facilityId: "f002" })
MATCH(destination: Facility { facilityId: "f003"})
WITH source,destination
CALL algo.shortestPath.stream(source, destination, "cost")
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).facilityId AS Facility, cost

//skc
MATCH(source: Facility { facilityId: "f002" })
MATCH(destination: Facility { facilityId: "f003"})
WITH source,destination
CALL algo.shortestPath.stream(source, destination, "cost")
YIELD nodeId, cost
WITH algo.getNodeById(nodeId) as n1,cost 
RETURN n1.facilityId,n1.name, cost


unweighted

MATCH(source: Facility { facilityId: "f002" }),
    (destination: Facility { facilityId: "f003"})
CALL algo.shortestPath.stream(source, destination, null)
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).facilityId AS Facility, cost


Yen algo

MATCH (start:Facility {facilityId:"f002"}),
      (end:Facility {facilityId:"f004"})
CALL algo.kShortestPaths.stream(start, end, 5, 'cost')
YIELD index, nodeIds, path, costs
RETURN index,
       [node in algo.getNodesById(nodeIds[1..-1]) | node.facilityId] AS via,
       reduce(acc=0.0, cost in costs | acc + cost) AS totalCost

 
 
Single source shortest path (SSSP - S3P)
MATCH (n:Facility {facilityId:"f001"})
CALL algo.shortestPath.deltaStepping.stream(n, "cost", 1.0)
YIELD nodeId, distance
WHERE algo.isFinite(distance)
RETURN algo.getNodeById(nodeId).facilityId AS destination, distance
ORDER BY distance


All pairs shortest path
This is probably not going to work because of the hetrogenous nodes

unweighted
CALL algo.allShortestPaths.stream('null')
YIELD sourceNodeId, targetNodeId, distance
WHERE sourceNodeId < targetNodeId
RETURN algo.getNodeById(sourceNodeId).id AS source,
       algo.getNodeById(targetNodeId).id AS target,
       distance
ORDER BY distance DESC
LIMIT 10

weighted
CALL algo.allShortestPaths.stream("cost")
YIELD sourceNodeId, targetNodeId, distance
WHERE sourceNodeId < targetNodeId
RETURN algo.getNodeById(sourceNodeId).facilityId AS source,
       algo.getNodeById(targetNodeId).facilityId AS target,
       distance
ORDER BY distance DESC
LIMIT 10
