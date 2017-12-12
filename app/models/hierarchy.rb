# Hierarchy referente aos patentes/graduacoes do CBMPE
class Hierarchy < ApplicationRecord
  has_many :military, dependent: :restrict_with_error

  before_save :uppercase_strings
  before_update :uppercase_strings

  # Tornar todas strings upercase
  def uppercase_strings
    name.upcase!
    acronym.upcase!
  end
end
