variable "owner" {
  description = "GitHub organization or user name"
  type        = string
}

variable "repository" {
  description = "Repository name"
  type        = string
}

variable "collaborators" {
  description = "Map of username => permission (pull|triage|push|maintain|admin)"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Map of Actions secret name => value"
  type        = map(string)
  default     = {}
}

variable "variables" {
  description = "Map of Actions variable name => value"
  type        = map(string)
  default     = {}
}

