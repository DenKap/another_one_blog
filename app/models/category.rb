class Category < ApplicationRecord
  validates :name, presence: true
  validates_format_of :name, with: /\p{Uppercase_Letter}/, message: 'must start with capital letter'
  validate :category_name

  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def category_name
    return if self.blank?
    errors.add(Category.name, 'name must be at least 2 words') if name.split.size < 2
    errors.add(Category.name, 'name must end with dot') if name[-1] != '.'
    name.split.each do |word|
      size = word.chars.size
      errors.add(Category.name, 'name must be at least 2 characters each word') if size < 2
    end
  end
end
