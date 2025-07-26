class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :published_at, type: Time

  validates :title, presence: true


  has_many :comments
end
