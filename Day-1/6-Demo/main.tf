
variable "number_of_files" {
  type    = list
  default = [10,20,30,40,50]
}
variable "file_content" {
  type    = string
  default = "This is a sample file created by Terraform."
}
resource "local_file" "filesystem-demo" {
    count = length(var.number_of_files)
    filename = "./demofile-${var.number_of_files[count.index]}.txt"
    content  = var.file_content
}

resource "random_id" "random_id_block" {
  byte_length = 5
}

output "random_id" {
  value = random_id.random_id_block.*
}