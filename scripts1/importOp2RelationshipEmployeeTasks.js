WITH "file:///op2_relationship_employee_task.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (employee:Employee {id: row.empId})
MATCH (task:Task {id: row.taskId})
MERGE (employee)-[:PERFORMS]->(task)