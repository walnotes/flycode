class Organization < ActiveRecord::Base
  attr_accessible :name, :address, :url, :facebook, :twitter, :instagram, :linkedin, :googleplus, :join, :donate, :related
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }

  def self.search(search)
    if search
  #    find(:all, :conditions => ['name ILIKE ?', "%#{search}%"])
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
