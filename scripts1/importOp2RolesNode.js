WITH "file:///op2_roles_node.csv"
AS uri
LOAD CSV WITH HEADERS FROM uri  AS row
MERGE (role:Role {id:row.id})
SET role.roleName = row.role_name	