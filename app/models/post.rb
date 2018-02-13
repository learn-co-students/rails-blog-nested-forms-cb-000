class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

#  accepts_nested_attributes_for :tags

  def tags_attributes=(tag_attributes)
    if tag_attributes.class == Array
      tag_attributes.each do |tag_attribute|
        if !tag_attribute.empty?
          self.tags.build(tag_attribute)
        end
      end
    else
      tag_attributes.each do |i, tag_attribute|
        if tag_attribute[:name].present?
          self.tags.build(tag_attribute)
        end
      end
    end
  end
end
