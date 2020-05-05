#### Sub modules

HashiCorp's Terraform Registry requires every repo to have a main.tf in its root dir.
The OPG AWS Config code is broken down into two sub-modules, so they can't all be in the
root dir /. Therefore, OPG AWS Config sub-modules are in the /modules subdirectory,
the example code is in the /examples subdirectory.

More info: https://github.com/hashicorp/terraform-aws-consul/pull/79/files/079e75015a5d89e7ffc89997aa0904e9de4cdb97#r212763365
