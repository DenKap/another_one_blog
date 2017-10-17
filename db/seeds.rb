Setting.create({
  email: "blog.owner@gmail.com",
  password: "5f4dcc3b5aa765d61d8327deb882cf99", # Digest::MD5.hexdigest('password')
  info: "I'm the Blog Owner",
  contact_email: "info@aoblog.com",
}) unless Setting.any?