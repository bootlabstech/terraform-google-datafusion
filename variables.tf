variable "name" {
  type        = string
  description = "this name will be used as prefix for all the resources in the module"
}
variable "project_id" {
  type        = string
  description = "this is the id of the project."
}
variable "description" {
  type        = string
  description = "this is the description of the instance."
}
variable "region" {
  type        = string
  description = "this is the region of the instance."
}
variable "datafusion_type" {
  type        = string
  description = "this is the type of the instance."
}
variable "logging_enabled" {
  type        = bool
  description = "states whether logging is enabled"
}
variable "monitoring_enabled" {
  type        = bool
  description = "states whether monitoring is enabled"
}
variable "datafusion_version" {
  type        = string
  description = "this is the version  of the instance."
}
variable "is_private" {
  type        = bool
  description = "states whether instance is private."
}
variable "network" {
  type        = string
  description = "this is the network of the instance."
}
variable "ip_allocation" {
  type        = string
  description = "this is the ip_allocation of the instance."
}
