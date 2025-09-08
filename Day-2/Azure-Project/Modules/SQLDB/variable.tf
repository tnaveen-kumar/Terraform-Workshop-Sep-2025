variable "env_name" { type = string }
variable "location" { type = string}
variable "sql_admin_username" { type = string }
variable "sql_password" { 
    type = string 
    sensitive = true 
}
variable "tags" { type = map(string) }