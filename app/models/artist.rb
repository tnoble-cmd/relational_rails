class Artist < ApplicationRecord
    has_many :songs

    def self.recently_created
        order(created_at: :desc)
    end
end