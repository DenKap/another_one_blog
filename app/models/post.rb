class Post < ApplicationRecord
  has_attached_file :file

  validates :name, presence: true
  validates_format_of :name, with: /\p{Uppercase_Letter}/, message: 'must start with capital letter'
  do_not_validate_attachment_file_type :file
  validates_attachment :file, size: { in: 0..2.megabytes, message: 'File must be smaller than 2Mb' }
  validate :post_name

  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  #has_many :post_files, dependent: :destroy

  def post_name
    return if self.blank?
    errors.add(Post.name, 'name must be at least 2 words') if name.split.size < 2
    errors.add(Post.name, 'name must end with dot') if name[-1] != '.'
    name.split.each do |word|
      size = word.chars.size
      errors.add(Post.name, 'name must be at least 2 characters each word') if size < 2
    end
  end
end
