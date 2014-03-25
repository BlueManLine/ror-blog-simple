class Post < ActiveRecord::Base

  belongs_to :user

  before_validation :make_slug
  validates :slug, presence: true, uniqueness: {message: "Title has already been taken"}

  private

  def make_slug
    self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

end
