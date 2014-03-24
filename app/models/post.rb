class Post < ActiveRecord::Base
    before_save :make_slug

    private

    def make_slug
        self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end
end
