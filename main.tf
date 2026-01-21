# Create S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket        = var.bucketname
  force_destroy = false
}

# Set ownership controls (Bucket Owner Enforced)
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Set public access block (allow public reads via policy)
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

# Bucket policy to allow public read
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.mybucket.arn}/*"
      }
    ]
  })
}

# S3 Objects (no ACLs, works with Owner Enforced)
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "profile.jpeg"
  source = "profile.jpeg"
}

# Website configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


