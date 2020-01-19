Set-Variable -Name importPath -Value "C:\workspace\Neo4jDesktop\neo4jDatabases\database-58bee3f3-92ae-4e57-bee6-79e70808f716\installation-3.5.14\import"
Set-Variable -Name dataFiles -Value "C:\workspace\neo4j-dra\scripts1\copyToImportFolder"
Remove-Item -path $importPath\* -Recurse -force
Copy-Item $dataFiles\* -Destination $importPath\ -Recurse -force
