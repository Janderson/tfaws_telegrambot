variable "aws_region" {
    description = "The default region of aws"
    default = "us-east-1"
}

variable "bot_token" {
    description = "token of bot into telegram"
    default = REPLACE_ME: TOKEN_GENERATE ON BOT FATHER
}

variable "bot_name" {
    default = "Jorge"
    description = "Name of bot response"
}
output "bot_token" {
    value = var.bot_token
}