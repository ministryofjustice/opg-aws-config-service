resource "aws_s3_bucket" "config" {
  bucket        = "${var.config_name}-${data.aws_caller_identity.current.account_id}"
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = 490
    }

    noncurrent_version_expiration {
      days = 10
    }
  }

}

resource "aws_s3_bucket_public_access_block" "config" {
  bucket = aws_s3_bucket.config.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "config_bucket" {
  bucket = aws_s3_bucket_public_access_block.config.bucket
  policy = data.aws_iam_policy_document.config_bucket.json
}

data "aws_iam_policy_document" "config_bucket" {
  policy_id = "PutObjPolicy"

  statement {
    sid    = "AWSConfigBucketPermissionsCheck"
    effect = "Allow"

    principals {
      identifiers = ["config.amazonaws.com"]
      type        = "Service"
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.config.arn]
  }

  statement {
    sid    = "AWSConfigBucketDelivery"
    effect = "Allow"

    principals {
      identifiers = ["config.amazonaws.com"]
      type        = "Service"
    }

    actions = [
    "s3:PutObject"]
    resources = [
      "${aws_s3_bucket.config.arn}/${var.config_logs_prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}/Config/*"
    ]

    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }

}
