class Categorium < ApplicationRecord

    validates :categoria, presence: true
    validates :tipo, presence: true
end
