

/* data "aws_ami" "ubuntu_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
*/
#ami=data.aws_ami.ubuntu_ami.id

resource "aws_kms_key" "enoh_kms_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  tags = {
    Name =env.tags
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = env.mybucket

}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse_configuration" {
  bucket = aws_s3_bucket.my-bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.enoh_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}


