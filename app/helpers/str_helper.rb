# Class manipulacao de strings
module StrHelper
  # Uppercase with i18n in '...activerecord...' info messages
  def self.upper_i18n(i18n)
    I18n.t(i18n).mb_chars.upcase.to_s
  end

  # Uppercase with i18n in attributes
  def self.attribute_i18n_upper(attribute, model)
    model = %i[activerecord attributes].concat(model)
    I18n.t(attribute, scope: model).mb_chars.upcase.to_s
  end

  # Uppercase with i18n in attributes
  def self.attribute_i18n(attribute, model)
    model = %i[activerecord attributes].concat(model)
    I18n.t(attribute, scope: model).mb_chars.to_s
  end

  # Uppercase with i18n in models
  def self.model_i18n_upper(quantity, scopes)
    scopes = %i[activerecord models].concat(scopes)
    I18n.t(quantity, scope: scopes).mb_chars.upcase.to_s
  end

  # I18n in models
  def self.model_i18n(quantity, scopes)
    scopes = %i[activerecord models].concat(scopes)
    I18n.t(quantity, scope: scopes).mb_chars.to_s
  end

  # Uppercase with i18n in systems
  def self.system_i18n_upper(system, scopes)
    I18n.t(system, scope: scopes).mb_chars.upcase.to_s
  end

  # I18n for systems
  def self.system_i18n(system, scopes)
    I18n.t(system, scope: scopes).mb_chars.to_s
  end

  # I18n for tooltips with params
  def self.tooltip_params_i18n(action, model, quantity)
    scopes = %i[helpers layouts]
    parameter = model_i18n(quantity, [model])
    I18n.t(action, scope: scopes, parameter: parameter).mb_chars.to_s
  end
end
