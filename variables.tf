## Declaring the variable section for the services we spin up in AWS

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "sgp" {
  type = list(any)
}

variable "subnet_id" {
  type = string
}

variable "product" {
  type = string
}

variable "tower" {
  type = string
}

variable "environment" {
  type = string
}

variable "mail" {
  type = string
}

variable "owner" {
  type = string
}

variable "place" {
  type = string
}

variable "country" {
  type = string
}

variable "division" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "purpose" {
  type = string
}

variable "pri_subnet_name" {
  type = string
}

variable "pri_purpose" {
  type = string
}
