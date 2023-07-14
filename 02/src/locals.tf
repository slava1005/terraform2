locals {
   web = "${var.vm_web_web}"
}
locals {
  name_vm1    = "${var.neto}-${var.env}-${var.project}-${var.role}"
}
locals {
   db = "${var.vm_web_db}"
}
locals {
  name_vm2    = "${var.neto}-${var.env}-${var.project}-${var.role}"
}

