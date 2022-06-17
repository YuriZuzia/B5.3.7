
variable "cloud_id" {
    type = string
    default = "b1gp2hsa65msuhi4n685"
}
variable "folder_id" {
  type = string
  default = "b1g5qe24o1sfk312vhrb"
}
variable "zone" {
  type = string
  default = "ru-central1-a"
}
variable "os-image-id" {
  description = "lemp image id is fd8it9bbj7qma34iaqgc"
  type = string
  default = "$(data.yandex_compute_image.lemp-image.id)"
}
data "yandex_compute_image" "lemp-image" {
    family = "lemp"
  }