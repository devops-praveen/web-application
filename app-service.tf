resource "azurerm_resource_group" "devops-rg" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_resource_group_location
}

resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.azurerm_app_service_plan_name
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name
  kind                = var.app_service_plan_size_kind
  reserved            = "true"
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
  tags = {
    "environment" = var.environment
  }
}

resource "azurerm_app_service" "aleti88-devops" {
  name                = var.azurerm_app_service_name
  location            = var.azurerm_resource_group_location
  resource_group_name = var.azurerm_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  site_config {
    linux_fx_version = "PYTHON|3.6"
    use_32_bit_worker_process = true
    always_on = false
  }
 

  tags = {
    "environment" = var.environment
  }
}