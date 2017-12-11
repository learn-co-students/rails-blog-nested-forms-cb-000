class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attributes|
      if tag_attributes && !tag_attributes[:name].empty?
        self.tags.build(tag_attributes)
      end
    end
  end
end
