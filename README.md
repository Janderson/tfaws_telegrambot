
Simple project to up a telegram bot using aws infrastructure, and simple deploy with terraform


Steps:
* replace REPLACE_ME_TOKEN_OF_BOT_FATHER on variables.tf file and put variable generate of bot father of telegram.
* run `pip install --target ./lambda_func requests`
* run `terraform init`
* run `terraform apply -auto-approve`


useful commands:
`aws lambda invoke --function-name "jjfunc2"  "out.txt"`

resources and learning:
* https://www.terraform.io/docs/language/providers/configuration.html


data:
* https://www.terraform.io/docs/language/data-sources/index.html
* https://www.terraform.io/docs/language/expressions/references.html


aws_iam_policy_document vs aws_iam_policy
* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document


