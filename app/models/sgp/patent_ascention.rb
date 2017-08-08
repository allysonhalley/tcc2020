class Sgp::PatentAscention < ActiveRecord::Base
  establish_connection(:ovrsgp)
  self.table_name ='ovrsgp.tb_prom'
  belongs_to :sgp_user, :class_name => 'Sgp::User', foreign_key: 'id_pess_fk'
  belongs_to :sgp_patent, :class_name => 'Sgp::Patent', foreign_key: 'id_cargo_fk'

  scope :current, -> {order(:dt_prom).last}

  def readonly?
    true
  end
end