provider "docker" {
   host = "${var.provider}"
}

resource "docker_image" "tuto-node" {
   name  = "tuto-node"
}

resource "docker_image" "tuto-lb" {
   name = "tuto-lb"
}

resource "docker_network" "network" {
    name   = "network"
    driver = "bridge"
    ipam_config {
        subnet = "172.17.0.1/16"
        gateway = "172.17.0.1"
    }
}

resource "docker_container" "app1" {
   image = "${docker_image.tuto-node.latest}"
   name  = "app1"
   networks = ["${docker_network.network.name}"]
   ports {
       internal = "${var.app-port}"
       external = 3000
   }
}

resource "docker_container" "app2" {
   image = "${docker_image.tuto-node.latest}"
   name = "app2"
   networks = ["${docker_network.network.name}"]
   ports {
     internal = "${var.app-port}"
     external = 3001
   }
}

resource "docker_container" "lb" {
   image ="${docker_image.tuto-lb.latest}"
   name  = "lb"
   networks = ["${docker_network.network.name}"]
   ports {
      internal = 80
      external = 80
   } 
}
