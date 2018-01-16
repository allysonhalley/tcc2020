# Classe responsavel por representar Carteiras
class Card < ApplicationRecord
  
  before_save :uppercase_strings
  before_update :uppercase_strings
  
  belongs_to :card_request
  belongs_to :card_status

  # Validacoes
  validates :naturalness, presence: true, length: { minimum: 3 }

  def register_and_name
    "#{registration} #{name}"
  end

  # Tornar todas strings upercase
  def uppercase_strings
    naturalness.upcase!
  end

  def fill_by_request(object_request_id) 
    card_request = CardRequest.find(object_request_id)
    military = Military.find_by_registration(card_request.military_registration)
    self.name = military.name
    self.hierarchy = military.hierarchy_name
    self.identification = military.identification
    self.father_name = military.father_name
    self.mother_name = military.mother_name
    self.born_date = military.born_date
    self.registration = military.registration
    self.naturalness = military.naturalness
    self.vote_number = military.vote_number
    self.vote_zone = military.vote_zone
    self.vote_section = military.vote_section
    self.cpf = military.cpf
    self.digital_factor = military.digital_factor
    self.blood_type = military.i18n_upper_blood_type
    self.blood_factor = military.i18n_upper_blood_factor
    self.carry_weapon = military.carry_weapon
    print_dt = DateTime.now    
    self.print_date = print_dt
    expire_dt = print_dt + 10.years
    self.expire_date = expire_dt
    self.card_request = card_request
    self.returned_card = :false
  end

  def document_request_name
    self.card_request.document_reference
  end

  def status_describe
    self.card_status.describe
  end

end
