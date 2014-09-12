class Profile < ActiveRecord::Base
	validates :about, presence: true,
                    length: { minimum: 1 }
end
