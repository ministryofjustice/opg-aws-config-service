provider "aws" {
  alias  = "main_region_provider"
  region = "eu-west-1"

  assume_role {
    role_arn     = "arn:aws:iam::123456789000:role/operator"
    session_name = "terraform-session"
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::123456789000:role/operator"
    session_name = "terraform-session"
  }
}
