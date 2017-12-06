# Hierarchy referente aos patentes/graduacoes do CBMPE
class Hierarchy < ApplicationRecord

    has_many :military, dependent: :restrict_with_error

end
