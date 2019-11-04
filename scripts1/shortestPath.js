Dijkstra algo

weighted

MATCH (source:Task {id: "t001",empId:"e001"}),      
	(destination:Task {id: "t008"})
CALL algo.shortestPath.stream(source, destination,  "effort")
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).id AS task, algo.getNodeById(nodeId).empId AS empId,cost

unweighted

MATCH (source:Task {id: "t001",empId:"e001"}),      
	(destination:Task {id: "t008"})
CALL algo.shortestPath.stream(source, destination,  null)
YIELD nodeId, cost
RETURN algo.getNodeById(nodeId).id AS task, algo.getNodeById(nodeId).empId AS empId,cost


Yen algo

MATCH (start:Task {id:"t001"}),
      (end:Task {id:"t011"})
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
MATCH (n:Task {id:"t001"})
CALL algo.shortestPath.deltaStepping.stream(n, "effort", 1.0)
YIELD nodeId, distance
WHERE algo.isFinite(distance)
RETURN algo.getNodeById(nodeId).id AS destination, distance
ORDER BY distance