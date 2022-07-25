resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id

  
  policy = filemd5("iam/lambda-policy.json")
}

resource "aws_iam_role_" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = filemd5("iam/lambda-assume-policy.json")
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${var.deployment_path_key}/${var.deployment_package_name}.zip"
  s3_bucket        = var.deployment_bucket_name
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "welcome.hello"

  runtime = "python3.9"
}