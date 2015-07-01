class Profile < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }

  def self.search(search = '', offset = 0, limit = 10)
    tags = search.split(' ')
    Profile.tagged_with(tags)
    # Profile.where('name LIKE ?', "%#{search}%").limit(limit).offset(offset)
  end

end
