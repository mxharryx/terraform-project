resource "azurerm_service_plan" "appserviceplan" {
    name                = "appserviceplan"
    resource_group_name = local.resource_group_name
    location            = local.location
    os_type             = "Windows"
    sku_name            = "S1"
    depends_on = [ azurerm_resource_group.webapp-rg ]
}

resource "azurerm_windows_web_app" "webapp-ex" {
    name                = "webapp-ex"
    resource_group_name = local.resource_group_name
    location            = local.location
    service_plan_id     = azurerm_service_plan.appserviceplan.id

site_config {
    application_stack {
        current_stack = "dotnet"
        dotnet_version = "v6.0"
    }
    }
    depends_on = [ azurerm_service_plan.appserviceplan ]
}

resource "azurerm_app_service_source_control" "gitrepo" {
    app_id   = azurerm_windows_web_app.webapp-ex.id
    repo_url = "https://github.com/mxharryx/webapp-azure"
    branch   = "master"
    use_manual_integration = true
}

resource "azurerm_windows_web_app_slot" "staging" {
    name           = "staging"
    app_service_id = azurerm_windows_web_app.webapp-ex.id
    
    site_config {
        application_stack {
        current_stack = "dotnet"
        dotnet_version = "v6.0"
    }
    }

    depends_on = [ azurerm_service_plan.appserviceplan ]
}