variable "project_id" {
}

variable "region" {
  default = "asia-northeast1"
}

variable "zone" {
  default = "asia-northeast1-a"
} 

variable "psql_root_password" {
  description = "PostgreSQLのルートパスワード"
  type        = string
  sensitive   = true
}