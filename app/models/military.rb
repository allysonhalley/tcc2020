class Military < ApplicationRecord
  belongs_to :hierarchy

  enum blood_type: {undefine_type: 0, a: 1, b: 2, ab: 3, o: 4}
  enum blood_factor: {undefine_factor: 0, positive: 1, negative: 2}
  enum situation: {active: 1, inactive: 2}
  enum firearm: {fit: 1, unfit: 2}

  # Internationalization (I18n)
  # blood_type: Internationalization (I18n)
  def i18n_blood_type
    I18n.t("activerecord.attributes.blood_types.#{blood_type}")
  end
  # Hash blood_types: Internationalization (I18n)
  def self.i18n_blood_types(hash = {})
    blood_types.keys.each { |key| hash[I18n.t("activerecord.attributes.blood_types.#{key}")] = key }
    hash
  end
  # blood_type: Internationalization (I18n)
  def i18n_blood_factor
    I18n.t("activerecord.attributes.blood_factors.#{blood_factor}")
  end
  # Hash blood_factors: Internationalization (I18n)
  def self.i18n_blood_factors(hash = {})
    blood_factors.keys.each { |key| hash[I18n.t("activerecord.attributes.blood_factors.#{key}")] = key }
    hash
  end
  # firearm: Internationalization (I18n)
  def i18n_firearm
    I18n.t("activerecord.attributes.firearms.#{firearm}")
  end
  # Hash firearms: Internationalization (I18n)
  def self.i18n_firearms(hash = {})
    firearms.keys.each { |key| hash[I18n.t("activerecord.attributes.firearms.#{key}")] = key }
    hash
  end

end
