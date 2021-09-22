resource "aws_apigatewayv2_api" "telegram_bot_api" {
    name = "telegram_bot_api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda_stage" {
    api_id = aws_apigatewayv2_api.telegram_bot_api.id
    name = "telegram_bot_lambda_stage"
    auto_deploy = true
}

resource "aws_apigatewayv2_integration" "bot_gw_integration" {
    api_id = aws_apigatewayv2_api.telegram_bot_api.id
    integration_uri = aws_lambda_function.lambda_func2.invoke_arn
    integration_method = "POST"
    integration_type = "AWS_PROXY"
}

resource "aws_apigatewayv2_route" "bot_gw_route" {
    api_id = aws_apigatewayv2_api.telegram_bot_api.id
    route_key = "ANY /chat"
    target = "integrations/${aws_apigatewayv2_integration.bot_gw_integration.id}"
}

resource "aws_lambda_permission" "bot_lambda_permission" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.lambda_func2.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.telegram_bot_api.execution_arn}/*/*"
}