resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  s3_bucket        = var.deployment_bucket_name
  s3_key = "${var.deployment_path_key}/${var.deployment_package_name}.zip"
  function_name = "my-sample-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "welcome.hello_handler"

  runtime = "python3.8"
}