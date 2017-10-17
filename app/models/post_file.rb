class PostFile < ApplicationRecord
  has_attached_file :file

  do_not_validate_attachment_file_type :file
  validates_attachment :file, size: { in: 0..2.megabytes, message: 'File must be smaller than 2Mb' }

  belongs_to :post
end
