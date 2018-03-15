class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  #below allows tags to be nested in our new post form
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  validates_presence_of :name, :content
end
