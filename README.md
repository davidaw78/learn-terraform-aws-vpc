# learn-terraform-aws-vpc
```ruby
alias tf="terraform"; alias tfa="terraform apply --auto-approve"; alias tfd="terraform destroy --auto-approve"; alias tfm="terraform init; terraform fmt; terraform validate; terraform plan"
```

## full free course on terraform
https://cloudcasts.io/course/terraform/introducing-terraform

## Where to find health of user_data in...
Windows
```ruby
C:\ProgramData\Amazon\EC2-Windows\Launch\Log\UserdataExecution.log
C:\Windows\Temp\UserScript.ps1
```
Linux
```ruby
/var/log/cloud-init.log
/var/log/cloud-init-output.log.log
```
## When to use locals.tf, variables.tf and locals or data
How to Use Terraform Variables (Locals, Input, Output, Environment) - https://spacelift.io/blog/how-to-use-terraform-variables

Terraform Locals: What Are They, How to Use Them - https://spacelift.io/blog/terraform-locals

## How to setup apache webserver for testing
```ruby
#!/bin/bash
# Define the path to the sshd_config file for Amazon Linux
sshd_config="/etc/ssh/sshd_config"

# Define the string to be replaced
old_string="PasswordAuthentication no"
new_string="PasswordAuthentication yes"

# Check if the file exists
if [ -e "$sshd_config" ]; then
    # Use sed to replace the old string with the new string
    sudo sed -i "s/$old_string/$new_string/" "$sshd_config"

    # Check if the sed command was successful
    if [ $? -eq 0 ]; then
        echo "String replaced successfully."
        # Restart the SSH service to apply the changes
        sudo service ssh restart
    else
        echo "Error replacing string in $sshd_config."
    fi
else
    echo "File $sshd_config not found."
fi

echo "123" | passwd --stdin ec2-user
systemctl restart sshd
until ping -c1 8.8.8.8 &>/dev/null; do :; done
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello From App Server! This is $(hostname -f)</h1>" > /var/www/html/index.html
```
## How to write terraform codes

https://developer.hashicorp.com/terraform/language/style

https://docs.gruntwork.io/guides/style/terraform-style-guide/

## Template in use
```ruby
https://earthly.dev/blog/create-manage-vpc-terraform/
https://spacelift.io/blog/terraform-aws-vpc
```
## https://developer.hashicorp.com/terraform/install
Check OS version for Linux
```ruby
cat /etc/os-release
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

