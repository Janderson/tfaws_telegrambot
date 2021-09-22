data "http" "telegram_call_back_" {
  url = "https://api.telegram.org/bot${var.bot_token}/setWebHook?url=${aws_apigatewayv2_stage.lambda_stage.invoke_url}/chat"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

output "telegram_set" {
    value = data.http.telegram_call_back_.url
}