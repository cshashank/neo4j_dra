WITH "file:///op2_tasks_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (task:Task {id:row.id})
SET task.taskName = row.task_name,
	task.priority = toInteger(row.priority),
	task.effort = toInteger(row.effort),
	task.empdId = row.emp_id