# add compute instance to the VPC
resource "google_compute_instance" "task2" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

#metadata_startup_script =  file("/startup.sh")

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
    # true by default
    auto_delete = true
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral public IP
    }
  }
tags = [ "http-server" ]

 # metadata = {
  #   startup-script-url = "${file("startup.sh")}"
  # }
 metadata_startup_script = file("startup.sh")
  
  # metadata_startup_script = <<-EOF
  #   #!/bin/bash
  #   apt-get update
  #   apt-get install -y apache2
  #   cat <<EOT > /var/www/html/index.html
  #   <html>
  #     <head>
  #       <title>Welcome to My Homepage</title>
  #     </head>
  #     <body>
  #       <h1>Welcome to My Homepage!</h1>
  #       <p>This page is served by Apache on a Google Compute Engine VM instance.</p>
  #     </body>
  #   </html>
  #   EOT
  # EOF
#depends_on = [ google_compute_network.task2_vpc,
 # google_compute_subnetwork.task2_subnet, google_compute_firewall.allow]
}