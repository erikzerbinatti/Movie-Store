class Movie < ActiveRecord::Base
	validates :name, presence: true

  def self.search(search)
    where("name like ?", "%#{search}%")
  end
end