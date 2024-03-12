terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }  
  }
}

provider "rafay" {
  # provider_config_file = "./rafay_config.json"
}

provider "github" {
  # provider_config_file = "./rafay_config.json"
}

resource "rafay_namespace_network_policy_rule" "demo-withinworkspacerule" {  
  metadata {    
    name    = var.within_ws_ntwrk_policy_rule_name
    project = var.project_name    
  }
  spec {
    artifact {
      type = "Yaml"
      artifact {    
        paths {                               
          name = "file://${path.module}/netfiles/${var.project_name}-within-ws-rule.yaml"        
        } 
      }
    }
    version = var.network_policy_rule_version
    sharing {
      enabled = false
    }
  }
}

resource "rafay_namespace_network_policy" "demo-withinworkspacepolicy" {
  depends_on = [rafay_namespace_network_policy_rule.demo-withinworkspacerule]
  metadata {
    name    = var.within_ws_ntwrk_policy_name
    project = var.project_name
  }
  spec {
    version = var.network_policy_rule_version
    rules {
      name = var.within_ws_ntwrk_policy_rule_name
      version = var.network_policy_rule_version
    }
    sharing {
      enabled = false
    }
  }
}

resource "rafay_namespace_network_policy_rule" "demo-denyallns-rule" {  
  depends_on = [rafay_namespace_network_policy.demo-withinworkspacepolicy]
  metadata {    
    name    = var.denyall_ns_ntwrk_rule_name
    project = var.project_name    
  }
  spec {
    artifact {
      type = "Yaml"
      artifact {    
        paths {                               
          name = "file://${path.module}/netfiles/${var.project_name}-deny-all-ns-rule.yaml"        
        } 
      }
    }
    version = var.network_policy_rule_version
    sharing {
      enabled = false
    }
  }
}

resource "rafay_namespace_network_policy" "demo-denyallns-policy" {
  depends_on = [rafay_namespace_network_policy_rule.demo-denyallns-rule]
  metadata {
    name    = var.denyall_ns_ntwrk_policy_name
    project = var.project_name
  }
  spec {
    version = var.network_policy_rule_version
    rules {
      name = var.denyall_ns_ntwrk_rule_name
      version = var.network_policy_rule_version
    }
    sharing {
      enabled = false
    }
  }
}