# provider "azurerm" {
#   subscription_id = "REPLACE-WITH-YOUR-SUBSCRIPTION-ID"
#   client_id       = "REPLACE-WITH-YOUR-CLIENT-ID"
#   client_secret   = "REPLACE-WITH-YOUR-CLIENT-SECRET"
#   tenant_id       = "REPLACE-WITH-YOUR-TENANT-ID"
# }

resource "azurerm_mssql_database" "db" {
  name                             = "${var.db_name}"
  server_id                        = azurerm_mssql_server.server.id
  collation                        = "${var.collation}"
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.location}"
  edition                          = "${var.db_edition}" 
  license_type                     = "LicenseIncluded"
  create_mode                      = "Default"
  requested_service_objective_name = "${var.service_objective_name}"
  tags                             = "${var.tags}"
}

resource "azurerm_mssql_server" "server" {
  name                         = "${var.server_name}-sqlsvr"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  version                      = "${var.server_version}"
  administrator_login          = "${var.sql_admin_username}"
  administrator_login_password = "${var.sql_password}"
  tags                         = "${var.tags}"
}

resource "azurerm_sql_firewall_rule" "fw" {
  name                = "${var.db_name}-fwrules"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_sql_server.server.name}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}
