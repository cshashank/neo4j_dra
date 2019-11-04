WITH "file:///op2_relationship_role_user.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri AS row
MATCH (role:Role {id: row.roleId})
MATCH (employee:Employee {id: row.empId})
MERGE (role)-[:CONTAINS ]->(employee)