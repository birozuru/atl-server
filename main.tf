module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGHLf+5fh3CCX+XZeK7Z5MQ5kHCh3sSRNNGtNBbvjhoiMHdtM40euDXUtEtVEReFP06nK8eYiZduT2ofPuQ/NB2YIysZ0pe+Le1w5WXukyf2tm6Pmrwk2VHdzlNeSAA2uqSFZGn8z791IJ10xcxjlv8uGuVjrm4t4Lo1Ivioowag6G7yteGw7hWULEj6ixrGWtws0oxbv/Brp0IekO3cbCX++Lyc4lf0JA7nET2iaLCQmXQ2kY+Pekb1HUaHZA4W6JE9kl9+m2lwU48/axbISPUPtggv2HqCR6U5HF+eDChuNIX/g7Zzqja/ZVyfp8+zWU9qg08mO11anMiAC8oPot ubuntu@ip-172-31-0-125"
  attach_admin_policy = true
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "onyebuchi-test-bucket-2"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
