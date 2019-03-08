

variable "subscription_id" {
    default = "23ddd0cb-6eaa-54a6-a33b-r15c36d53a88"
}
variable "client_id" {
    default = "1999ba7f-5555-4444-1111-2222a6666d9e"
}
variable "client_secret" {
    default = "000000000pUQpLhFW7SS17hKKC/00000000000+qi1k="
}
variable "tenant_id" {
    default = "11111111-2222-3333-4444-555566667777"
}

variable "prefix" {
  default = "ubnt_test"
  description = "The Prefix used for all resources in this example"
}

variable "location" {
  default = "West Europe"
  description = "The Azure Region in which the resources in this example should exist"
}

variable "tags" {
  type        = "map"
  default     = {
      environment = "ubnt_test"
  }
  description = "Any tags which should be assigned to the resources in this example"
}

variable "vm_username" {
    default = "demoadmin"
}
variable "vm_password" {
    default = "Passw0rd#NobodyKnows"
}

variable "instance_count" {
    default = 1
}
