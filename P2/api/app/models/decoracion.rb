class Decoracion < ApplicationRecord
  belongs_to :decora_a, polymorphic: true
end
