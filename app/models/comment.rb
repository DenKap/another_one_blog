class Comment < ApplicationRecord
  validates :author, presence: true
  validate :valid_author_name
  validates_presence_of :content

  belongs_to :commentable, polymorphic: true

  def valid_author_name
    return if self.blank?
    errors.add(Comment.name, 'author name must be at least 2 words') if author.split.size < 2
    errors.add(Comment.name, 'author name must end with dot') if author[-1] != '.'
    author.split.each do |word|
      size = word.chars.size
      errors.add(Comment.name, 'name must be at least 2 characters each word') if size < 2
      errors.add(Comment.name, 'author name must start with capital letter (each word)') unless word[0].match?(/\p{Upper}/)
    end
  end
end
