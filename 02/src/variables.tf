###cloud vars
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


###name VM vars

variable "vm_web_web" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM1 name"
}

variable "vm_web_db" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM2 name"
}

resource "yandex_compute_instance" "platform" {

# name        = var.vm_web_web
  name        = "${local.web}"
  platform_id = "standard-v2"
  resources {
    cores        = var.vm_web_resources.cores
    cores        = var.vm_web_resources.memory
    cores        = var.vm_web_resources.core_fraction
 }
resource "yandex_compute_instance" "platform-db" {

  name        = "${local.db}"
  platform_id = "standard-v2"
  resources {
    cores        = var.vm_db_resources.cores
    cores        = var.vm_db_resources.memory
    cores        = var.vm_db_resources.core_fraction
 }

###yandex_compute_image vars
variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu release name"
}

###yandex_compute_instance vars
### VM1
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_web_mem" {
  type        = number
  default     = 2
  description = "fraction"
}

variable "vm_web_frac" {
  type        = number
  default     = 20
  description = "memory"
}

###yandex_compute_instance vars
### VM2
variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "cores"
}

variable "vm_db_mem" {
  type        = number
  default     = 2
  description = "fraction"
}

variable "vm_db_frac" {
  type        = number
  default     = 20
  description = "memory"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}
