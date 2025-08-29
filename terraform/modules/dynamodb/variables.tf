variable "env" {
  description = "This is the environment name eg. dev/stg/prd"
  type = string
}

variable "hash_key" {
  description ="This is the hash_key for dynamodb table"
}