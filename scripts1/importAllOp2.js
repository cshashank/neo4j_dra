match (n) detach delete n
WITH "file:///op2_employee_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (employee:Employee {id:row.id})
SET employee.firstName = row.first_name,
	employee.lastName = row.last_name

WITH "file:///op2_tasks_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (task:Task {id:row.id})
SET task.taskName = row.task_name,
	task.priority = toInteger(row.priority),
	task.effort = toInteger(row.effort)	

WITH "file:///op2_roles_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (role:Role {id:row.id})
SET role.roleName = row.role_name	

WITH "file:///op2_relationship_role_user.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (role:Role {id: row.roleId})
MATCH (employee:Employee {id: row.empId})
MERGE (role)-[:CONTAINS ]->(employee)

WITH "file:///op2_relationship_employee_task.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (employee:Employee {id: row.empId})
MATCH (task:Task {id: row.taskId})
MERGE (employee)-[:PERFORMS]->(task)