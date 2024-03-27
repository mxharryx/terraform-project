resource "azurerm_monitor_action_group" "email_alert" {
    name                = "email-alert"
    resource_group_name = local.resource_group_name
    short_name          = "email-alert" 

    email_receiver {
    name          = "send-email-alert"
    email_address = var.email_address
    use_common_alert_schema = true
    }
}

resource "azurerm_monitor_metric_alert" "requests_threshold_alert" {
    name                = "requests-threshold-alert"
    resource_group_name = local.resource_group_name
    scopes              = [azurerm_windows_web_app.webapp-ex.id]
    description         = "Alert triggered when requests exceed 1"
    
    criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Requests"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1
    }
    
    action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
    }

    depends_on = [ azurerm_windows_web_app.webapp-ex, azurerm_monitor_action_group.email_alert ]
}

resource "azurerm_monitor_activity_log_alert" "webapp_ops" {
    name                = "webapp-ops"
    resource_group_name = local.resource_group_name
    scopes              = [azurerm_resource_group.webapp-rg.id]
    description         = "This alert will be sent if the webapp is stopped."
    
    criteria {
    resource_id    = azurerm_windows_web_app.webapp-ex.id
    operation_name = "Microsoft.Web/sites/stop/Action"
    category       = "Administrative"
    }
    
    action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
    }
    
    depends_on = [ azurerm_windows_web_app.webapp-ex, azurerm_monitor_action_group.email_alert ]
}

