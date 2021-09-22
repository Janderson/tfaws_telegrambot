data "archive_file" "lambda_code" {
    type = "zip"
    output_path = "lambda_func.zip"
    source_dir = "${path.module}/lambda_func"
}

data "aws_iam_policy_document" "lambda_func_policy" {
    statement {
        sid = ""
        effect = "Allow"
        principals {
            identifiers = ["lambda.amazonaws.com"]
            type = "Service"
        }
        actions = ["sts:AssumeRole"]
    }
}

resource "aws_iam_role" "iam_for_lambda" {
    name = "lambda_func_2"
    assume_role_policy = data.aws_iam_policy_document.lambda_func_policy.json
}

output "arn_of_iam" {
    value = aws_iam_role.iam_for_lambda.arn
    description = "arn of iam"
}

resource "aws_lambda_function" "lambda_func2" {
    function_name = "jjfunc2"


    filename = data.archive_file.lambda_code.output_path
    source_code_hash = data.archive_file.lambda_code.output_base64sha256

    role = aws_iam_role.iam_for_lambda.arn
    runtime = "python3.8"
    handler = "telegram_bot.lambda_handler"

    environment {
        variables = { # porque ser que tem um igual aqui???
            jj_env_var = "hey there"
            bot_name = var.bot_name
            bot_token = var.bot_token
        }
    }
}

output "lambda_func_arn" {
    value = aws_lambda_function.lambda_func2.arn
}