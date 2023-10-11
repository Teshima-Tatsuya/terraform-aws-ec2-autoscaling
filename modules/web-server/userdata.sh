#!/bin/bash 

yum install httpd -y
systemctl start httpd
systemctl enable httpd

touch /var/www/html/index.html

yum install amazon-cloudwatch-agent -y

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
  -a fetch-config \
  -m ec2 \
  -s \
  -c ssm:cloudwatch_agent_config