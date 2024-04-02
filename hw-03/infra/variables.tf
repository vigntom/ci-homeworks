###cloud vars
variable "token" {
  type        = string
  sensitive = true
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "env" {
  type = string
  default = "dev"
  description = "Environment name"
}

variable "vms" {
  type = list(object({ name:string, cpu:number, memory:number, fraction:number, platform:string }))
  default = [{
    name: "vm-1",
    cpu: 2,
    memory: 4,
    fraction: 5,
    platform: "standard-v2"
  },
  {
    name: "vm-2",
    cpu: 2,
    memory: 4,
    fraction: 5,
    platform: "standard-v2"
  },
]

  description = "VMS instances"
}
