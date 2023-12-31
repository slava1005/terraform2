variable "token" {
  type        = string
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
  description = "VPC network & subnet name"
}

###ssh vars
#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-rsa 
#  description = "ssh-keygen -t ed25519"
#}

###ssh map vers
variable "vms_ssh_root_key" {
  type = map(any)
  default = {
   serial-port-enable   = 1
   ssh-keys             = "ssh-rsa" 
  }
}
###yandex_compute_image vars
variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu release name"
}
### Объявим переменные для VM1
variable "neto" {
  type        = string
  description = "netology"
}
variable "env" {
  type        = string
  description = "develop"
}
variable "project" {
  type        = string
  description = "platform"
}
variable "role" {
  type        = string
  description = "web"
}

### Объявим переменные для VM2
variable "neto2" {
  type        = string
  description = "netology"
}
variable "env2" {
  type        = string
  description = "develop"
}
variable "project2" {
  type        = string
  description = "platform"
}
variable "role2" {
  type        = string
  description = "db"
}
###locals {
###  name_vm1    = "${var.neto}-${var.env}-${var.project}-${var.role}"
###}

###name VM vars
variable "vm_web_web" {
  type        = string
  default     = "name_vm1"
  description = "VM1 name"
}

variable "vm_web_db" {
  type        = string
  default     = "name_vm2"
###  default     = "netology-develop-platform-db"
  description = "VM2 name"
}

###yandex_compute_instance vars
#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "cores"
#}

#variable "vm_web_mem" {
#  type        = number
#  default     = 1
#  description = "memory"
#}

#variable "vm_web_frac" {
#  type        = number
#  default     = 5
#  description = "fraction"
#}

###vm_web_resources var

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 20
 }
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 20
  }
}
