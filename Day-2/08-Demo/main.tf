module "rg_creation" {
  source = "git::https://github.com/tnaveen-kumar/terraform-module.git"
  rg-name = "remote-mod-rg"
  rg-location = "south india"
}