output "resource_group_id" {
    value = azurerm_resource_group.devops-rg.id
}

output "serviceplan_id" {
    value = azurerm_app_service_plan.appserviceplan.id
}

output "appservice_url" {
    value = azurerm_app_service.aleti88-devops.default_site_hostname
}