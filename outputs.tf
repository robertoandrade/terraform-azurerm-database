output "database_name" {
  description = "Database name of the Azure SQL Database created."
  value       = "${azurerm_mssql_database.db.name}"
}

output "sql_server_name" {
  description = "Server name of the Azure SQL Database created."
  value       = "${azurerm_mssql_server.server.name}"
}

output "sql_server_location" {
  description = "Location of the Azure SQL Database created."
  value       = "${azurerm_mssql_server.server.location}"
}

output "sql_server_version" {
  description = "Version the Azure SQL Database created."
  value       = "${azurerm_mssql_server.server.version}"
}

output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name (FQDN) of the Azure SQL Database created."
  value       = "${azurerm_mssql_server.server.fully_qualified_domain_name}"
}

output "connection_string" {
  description = "Connection string for the Azure SQL Database created."
  value       = "Server=tcp:${azurerm_mssql_server.server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.server.administrator_login};Password=${azurerm_mssql_server.server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
