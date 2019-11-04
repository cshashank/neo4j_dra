WITH "file:///op2_employee_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (employee:Employee {id:row.id})
SET employee.firstName = row.first_name,
	employee.lastName = row.last_name