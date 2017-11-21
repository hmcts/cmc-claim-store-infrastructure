variable "product" {
  type    = "string"
  default = "cmc"
}

variable "qaslotname" {
  default     = "qa"
  description = "Name of qa slot"
}

variable "devslotname" {
  default     = "dev"
  description = "Name of dev slot"
}

variable "lastknowngoodslotname" {
  default     = "lastknowngood"
  description = "Name of last known good slot"
}

variable "location" {
  type    = "string"
  default = "UK South"
}

variable "env" {
  type = "string"
}

variable "infrastructure_env" {
  default     = "dev"
  description = "Infrastructure environment to point to"
}
