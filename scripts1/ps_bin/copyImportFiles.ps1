Set-Variable -Name importPath -Value "C:\workspace\Neo4jDesktop\neo4jDatabases\database-ef2a725b-c031-47fe-952e-9d406c80635d\installation-4.0.0\import"
Set-Variable -Name dataFiles -Value "C:\workspace\neo4j-dra\scripts1\copyToImportFolder"
Remove-Item -path $importPath\* -Recurse -force
Copy-Item $dataFiles\* -Destination $importPath\ -Recurse -force
