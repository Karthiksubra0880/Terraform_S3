provider "aws" {
  access_key = "AKIAUCCLN37GPCAMF5OQ"
  secret_key = "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"
  region     = "ap-south-1"

}

resource "aws_s3_bucket" "mybucket" {
   bucket = "mytest-bucket082414"
   acl    = "private"

  tags = {
    Name = "Hellobucket"

  }

}
resource "aws_s3_bucket_object" "object1" {
  for_each = fileset("myfiles/", "*")
  bucket   = aws_s3_bucket.mybucket.id
  key      = each.value
  source   = "myfiles/${each.value}"
  etag     = filemd5("myfiles/${each.value}")
}
