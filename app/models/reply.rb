class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  validates_length_of :content, :minimum => 5

  belongs_to :user
  belongs_to :topic
  has_many :child_replies, :class_name => "Reply", :inverse_of => :parent_reply, :dependent => :destroy
  belongs_to :parent_reply, :class_name => "Reply", :inverse_of => :child_replies
end
