class Bicicleta < ApplicationRecord
    has_many :decoracions, as: :decora_a, dependent: :destroy
end
