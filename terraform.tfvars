## Variables.tf values feeding section

region          = "ap-south-1"
name            = "web-1"
instance_type   = "t2.micro"
ami_id          = "ami-00bf4ae5a7909786c"
sgp             = ["sg-0fb1052b659369aa8"]
subnet_id       = "subnet-e9190a81"
key_name        = "ondot"
product         = "apache-web-app"
tower           = "CloudOps"
environment     = "Development"
mail            = "Thangadurai.murugan@example.com"
owner           = "DevOps-team"
place           = "Bangalore-offshore"
country         = "India-KA"
division        = "SAAS"
subnet_name     = "demo-public-subnet"
purpose         = "Used to connect only Internet facing instances"
pri_subnet_name = "demo-private-subnet"
pri_purpose     = "Used to connect only intranet facing instances"

