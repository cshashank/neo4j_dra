match (n) detach delete n
WITH "file:///op2_tasks_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (task:Task {id:row.id})
SET task.taskName = row.task_name,
	task.priority = toInteger(row.priority),
	task.effort = toInteger(row.effort),
	task.empId = row.emp_id	

WITH "file:///op2_relationship_task2task.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (source:Task {id: row.sourceTask})
MATCH (dest:Task {id: row.targetTask})
MERGE (source)-[r:DEPENDS ]->(dest)
SET r.effort = toInteger(row.intEdge)