Dijkstra algo

weighted

MATCH(source: Facility { id: "fac002" }),
    (destination: Facility { id: "fac004"})
CALL algo.shortestPath.stream(source, destination, "cost")
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).id AS Facility, cost

unweighted

MATCH(source: Facility { id: "fac002" }),
    (destination: Facility { id: "fac004"})
CALL algo.shortestPath.stream(source, destination, null)
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).id AS Facility, cost


Yen algo

MATCH (start:Facility {id:"fac002"}),
      (end:Facility {id:"fac004"})
CALL algo.kShortestPaths.stream(start, end, 5, 'effort')
YIELD index, nodeIds, path, costs
RETURN index,
       [node in algo.getNodesById(nodeIds[1..-1]) | node.id] AS via,
       reduce(acc=0.0, cost in costs | acc + cost) AS totalCost

 All pairs shortest path

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
CALL algo.allShortestPaths.stream("effort")
YIELD sourceNodeId, targetNodeId, distance
WHERE sourceNodeId < targetNodeId
RETURN algo.getNodeById(sourceNodeId).id AS source,
       algo.getNodeById(targetNodeId).id AS target,
       distance
ORDER BY distance DESC
LIMIT 10

Single source shortest path (SSSP - S3P)
MATCH (n:Facility {id:"fac001"})
CALL algo.shortestPath.deltaStepping.stream(n, "cost", 1.0)
YIELD nodeId, distance
WHERE algo.isFinite(distance)
RETURN algo.getNodeById(nodeId).id AS destination, distance
ORDER BY distance