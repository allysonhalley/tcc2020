# Class metodos que auxiliam CardRequest
module CardsHelper
  def self.fit_carry_weapon(fit)
    case fit
    when true
      StrHelper.system_i18n_upper(:fit, %i[helpers select])
    when false
      StrHelper.system_i18n_upper(:unfit, %i[helpers select])
    end
  end

  def self.returned_old_card(returned)
    case returned
    when true
      StrHelper.system_i18n_upper(:returned, %i[helpers select])
    when false
      StrHelper.system_i18n_upper(:unreturned, %i[helpers select])
    end
  end

  # return Registration and Name
  def self.register_name(registration)
    card = Card.find_by_registration(registration)
    card.register_and_name
  end

  # Verificacao para nova solicitacao
  def self.card_printed_exist(registration)
    Card.joins(:card_status).where(card_statuses: { describe: 'PRINTED' }).where(registration: registration).present?
  end

  # Verificacao para nova solicitacao
  def self.find_to_discard(card_request_id)
    #Card.joins(:card_status).where(card_statuses: { describe: ['PRINTED', 'USING'] }).where(card_request: card_request_id).first
    Card.find_by_card_request_id(card_request_id)
  end
  
  def self.validate_card_number_by_card(card_number)
    Card.joins(:card_status).where.not(card_statuses: { describe: ['USING'] }).where(card_number: card_number).present?
  end

end
