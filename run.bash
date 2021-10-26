# !bin/bash

# exit when any command fails 
set -e 

echo "install terrafrom"
git clone https://github.com/hashicorp/terraform.git
cd terraform
go install
terraform -help
