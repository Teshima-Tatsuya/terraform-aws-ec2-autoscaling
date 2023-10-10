resource "aws_ssm_parameter" "cloudwatch_agent_config" {
    name = "cloudwatch_agent_config"
    type = "String"
    value = file("${path.module}/cloudwatch_agent_config.json")
}