class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content

  validates_length_of :title, :in => 2..50

  validates_length_of :content, :minimum => 20

  belongs_to :user
  has_many :replies, :dependent => :destroy
end
