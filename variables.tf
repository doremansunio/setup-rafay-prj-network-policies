variable "central_pool_name" {
  type = string  
}

variable "project_name" {
  type = string  
} 

variable "cluster_name" {
  type = string
}

variable "workspace_admins" {
  type    = list  
}

variable "projects_to_share" {
  type    = list  
}

variable "within_ws_ntwrk_policy_name" {
  type = string
}

variable "denyall_ns_ntwrk_policy_name" {
  type = string
}

variable "within_ws_ntwrk_rule_name" {
  type = string
}

variable "denyall_ns_ntwrk_rule_name" {
  type = string
}

variable "network_policy_rule_version" {
  type = string  
}

variable "git_repo_name" {
  type = string  
}

variable "git_repo_branch" {
  type = string  
}
