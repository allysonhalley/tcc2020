# Classe responsavel por representar Militar
class Military < ApplicationRecord
  before_save :uppercase_strings
  before_update :uppercase_strings

  before_validation :clean_mask

  # Validacoes
  validates :name, presence: true, length: { minimum: 3 }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
  validates :identification, presence: true, length: { is: 8 }
  validates :father_name, length: { minimum: 3 }
  validates :mother_name, length: { minimum: 3 }
  validates :born_date, presence: true
  validates :registration, presence: true, length: { is: 7 }
  validates :naturalness, presence: true, length: { minimum: 3 }
  validates :vote_number, presence: true, length: { is: 12 }
  validates :vote_zone, presence: true, length: { is: 3 }
  validates :vote_section, presence: true, length: { is: 3 }
  validates :digital_factor, presence: true, length: { is: 10 }
  validates :blood_type, presence: true
  validates :blood_factor, presence: true
  validates :firearm, presence: true

  belongs_to :hierarchy

  enum blood_type: { undefine_type: 0, a: 1, b: 2, ab: 3, o: 4 }
  enum blood_factor: { undefine_factor: 0, positive: 1, negative: 2 }
  enum situation: { active: 1, inactive: 2 }
  enum firearm: { fit: 1, unfit: 2 }

  # Tornar todas strings upercase
  def uppercase_strings
    name.upcase!
    father_name.upcase!
    mother_name.upcase!
    naturalness.upcase!
  end

  def clean_mask
    cpf.gsub!(/[^0123456789]/, '')
    identification.gsub!(/[^0123456789]/, '')
    registration.gsub!(/[^0123456789]/, '')
    vote_number.gsub!(/[^0123456789]/, '')
    vote_zone.gsub!(/[^0123456789]/, '')
    vote_section.gsub!(/[^0123456789]/, '')
    digital_factor.gsub!(/[^a-zA-Z0-9]/, '')
  end

  def register_and_name
    "#{registration} #{name}"
  end

  def hierarchy_name
    self.hierarchy.name
  end

  def hierarchy_acronym
    self.hierarchy.acronym
  end

  # Formatacao de data para exibicao
  def date_formatted
    born_date.strftime('%d/%m/%Y') if born_date?
  end

  # Internationalization (I18n)
  # blood_type: Internationalization (I18n)
  def i18n_blood_type
    StrHelper.attribute_i18n(blood_type.to_sym, %i[military blood_types])
  end

  # blood_type: Internationalization (I18n)
  def i18n_upper_blood_type
    StrHelper.attribute_i18n_upper(blood_type.to_sym, %i[military blood_types])
  end

  # Hash blood_types: Internationalization (I18n)
  def self.i18n_blood_types(hash = {})
    blood_types.each_key do |key|
      hash[StrHelper.attribute_i18n(key.to_sym, %i[military blood_types])] = key
    end
    hash
  end

  # Hash blood_types: Internationalization (I18n) with uppercase
  def self.i18n_upper_blood_types(hash = {})
    blood_types.each_key do |key|
      hash[StrHelper.attribute_i18n_upper(key.to_sym, %i[military blood_types])] = key
    end
    hash
  end

  # blood_type: Internationalization (I18n)
  def i18n_blood_factor
    StrHelper.attribute_i18n(blood_factor.to_sym, %i[military blood_factors])
  end

  # blood_factor: Internationalization (I18n) with uppercase
  def i18n_upper_blood_factor
    StrHelper.attribute_i18n_upper(blood_factor.to_sym, %i[military blood_factors])
  end

  # Hash blood_factors: Internationalization (I18n)
  def self.i18n_blood_factors(hash = {})
    blood_factors.each_key do |key|
      hash[StrHelper.attribute_i18n(key.to_sym, %i[military blood_factors])] = key
    end
    hash
  end

  # Hash blood_factors: Internationalization (I18n) with uppercase
  def self.i18n_upper_blood_factors(hash = {})
    blood_factors.each_key do |key|
      hash[StrHelper.attribute_i18n_upper(key.to_sym, %i[military blood_factors])] = key
    end
    hash
  end

  # firearm: Internationalization (I18n)
  def i18n_firearm
    StrHelper.attribute_i18n(firearm.to_sym, %i[military firearms])
  end

  # firearm: Internationalization (I18n) with uppercase
  def i18n_upper_firearm
    StrHelper.attribute_i18n_upper(firearm.to_sym, %i[military firearms])
  end

  # Hash firearms: Internationalization (I18n)
  def self.i18n_firearms(hash = {})
    firearms.each_key do |key|
      hash[StrHelper.attribute_i18n(key.to_sym, %i[military firearms])] = key
    end
    hash
  end

  # Hash firearms: Internationalization (I18n) with uppercase
  def self.i18n_upper_firearms(hash = {})
    firearms.each_key do |key|
      hash[StrHelper.attribute_i18n_upper(key.to_sym, %i[military firearms])] = key
    end
    hash
  end
end
