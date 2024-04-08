# learn-terraform-aws-vpc

alias tf="terraform"
alias tfa="terraform apply --auto-approve"
alias tfd="terraform destroy --auto-approve"
alias tfm="terraform fmt; terraform validate; terraform plan"

## How to install terraform in ubuntu
```ruby
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## How to install AWS cli
```ruby
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

how to create a vpc with public and private subnet with igw and nat

This is a good resource - https://earthly.dev/blog/create-manage-vpc-terraform/

# aws-3-tier-architecture-one-vpc

https://medium.com/@aaloktrivedi/building-a-3-tier-web-application-architecture-with-aws-eb5981613e30

https://antonputra.com/amazon/create-alb-terraform/#create-golang-rest-api

https://developer.hashicorp.com/terraform/tutorials/aws/aws-asg

https://spacelift.io/blog/terraform-autoscaling-group

https://stackoverflow.com/questions/44609595/set-a-unique-tag-to-each-instance-of-terraform-aws-autoscaling-group-module/44613778#44613778

Read this on how to understand terraform alb to include autoscaling - https://developer.hashicorp.com/terraform/tutorials/aws/aws-asg

This Should I Me Resolve User_data

debase it in 64 as a file park in outside the code - https://developer.hashicorp.com/terraform/language/functions/base64encode

debase it in 64 as a file park in inside the code - https://github.com/hashicorp/terraform-provider-aws/issues/5530

decode the user_data and copy and paste the hash - https://mahira-technology.medium.com/encoding-user-data-using-base64-command-and-adding-the-encoded-userdata-in-ec2-instance-c0ece46f7222

https://copyprogramming.com/howto/terraform-aws-launch-template-user-data-variables-separation-local-and-ec2-execution

