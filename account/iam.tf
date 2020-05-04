# Get the access to the effective Account ID in which Terraform is working.
data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "aws_config_policy" {
  policy_id = "PutObjPolicy"
  statement {
    sid       = "AWSConfigBucketPermissionsCheck"
    effect    = "Allow"
    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.config.arn]
  }

  statement {
    sid       = "AWSConfigBucketExistenceCheck"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.config.arn]
  }

  statement {
    sid       = "AWSPublish"
    effect    = "Allow"
    actions   = ["SNS:Publish"]
    resources = ["*"]
  }

  statement {
    sid       = "AWSConfigBucketDelivery"
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.config.arn}/${var.config_logs_prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}/Config/*"]
    condition {
      test     = "StringLike"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
}

# Allow the AWS Config role to deliver logs to configured S3 Bucket.
# Derived from IAM Policy document found at https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html


# Allow IAM policy to assume the role for AWS Config
data "aws_iam_policy_document" "aws-config-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    effect = "Allow"
  }
}

#
# IAM
#

resource "aws_iam_role" "config" {
  name               = "${var.config_name}-role"
  assume_role_policy = data.aws_iam_policy_document.aws-config-role-policy.json
  tags               = local.default_tags
}

resource "aws_iam_role_policy_attachment" "managed-policy" {
  role       = aws_iam_role.config.name
  policy_arn = format("arn:%s:iam::aws:policy/service-role/AWSConfigRole", data.aws_partition.current.partition)
}

resource "aws_iam_policy" "aws-config-policy" {
  name   = "${var.config_name}-policy"
  policy = data.aws_iam_policy_document.aws_config_policy.json
}

resource "aws_iam_role_policy_attachment" "aws-config-policy" {
  role       = aws_iam_role.config.name
  policy_arn = aws_iam_policy.aws-config-policy.arn
}
