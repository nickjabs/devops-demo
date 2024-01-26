provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "php-1" {
  name  = "demo-php-container"
  image = "kikibuh/pimcore-demo:latest"
  ports {
    internal = 80
    external = 80
  }
  volumes {
    host_path      = "/path/to/your/app"
    container_path = "/var/www/html"
  }
  depends_on = ["demo_db"]
  environment = [
    "MYSQL_HOST=${var.mysql_host}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
  ]
}

resource "docker_container" "db-1" {
  name  = "demo-db-container"
  image = "mysql:5.7"
  environment = {
    MYSQL_ROOT_PASSWORD = "${var.mysql_root_password}"
    MYSQL_USER         = "${var.mysql_user}"
    MYSQL_PASSWORD     = "${var.mysql_password}"
    MYSQL_DATABASE     = "${var.mysql_database}"
  }
}

variable "mysql_host" {}
variable "mysql_user" {}
variable "mysql_password" {}
variable "mysql_database" {}
variable "mysql_root_password" {}
