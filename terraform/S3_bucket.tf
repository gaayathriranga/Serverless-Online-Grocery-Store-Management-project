

resource "aws_s3_bucket" "public_website_bucket" {
  bucket = var.website_bucket_name_public
  tags   = var.tags
}

resource "aws_s3_bucket_ownership_controls" "public_website_bucket_controls" {
  bucket = aws_s3_bucket.public_website_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_website_bucket_access_block" {
  bucket = aws_s3_bucket.public_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_website_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_website_bucket_controls,
    aws_s3_bucket_public_access_block.public_website_bucket_access_block,
  ]

  bucket = aws_s3_bucket.public_website_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.public_website_bucket.id
  key          = var.web_hosting_file_s3
  source       = "${path.module}/front-end/${var.web_hosting_file_s3}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "public_website_bucket_website" {
  bucket = aws_s3_bucket.public_website_bucket.id

  index_document {
    suffix = var.web_hosting_file_s3
  }

  depends_on = [aws_s3_bucket_acl.public_website_bucket_acl]
}



resource "aws_s3_object" "js_file" {
  for_each = var.js_file

  bucket       = aws_s3_bucket.public_website_bucket.id
  key          = each.key
  source       = "${path.module}/front-end/${each.key}"  
  acl          = "public-read"
  content_type = each.value
}




resource "aws_s3_object" "api_url_js_file" {
  for_each = var.api_url_js_file

  bucket       = aws_s3_bucket.public_website_bucket.id
  key          = each.key
  source       = "${path.module}/front-end/${each.key}"  
  acl          = "public-read"
  content_type = each.value
}




resource "aws_s3_bucket_cors_configuration" "public_website_bucket_cors" {
  bucket = aws_s3_bucket.public_website_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST", "PUT", "DELETE", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

