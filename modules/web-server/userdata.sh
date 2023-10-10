#!/bin/bash 

yum install httpd -y
systemctl start httpd
systemctl enable httpd

yum install amzon-cloudwatch-agent -y

/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-cli \
  -a fetch-config \
  -m ec2 \
  -c ssm:cloudwatch_agent_config