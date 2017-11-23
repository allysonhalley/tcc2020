# Hierarchy referente aos patentes/graduacoes do CBMPE
class Hierarchy < ApplicationRecord

    scope :hierarchy_acronym, -> {select(:acronym).all}

end
