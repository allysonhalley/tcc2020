class Sgp::User < ActiveRecord::Base
  establish_connection(:ovrsgp)
  self.table_name = 'ovrsgp.tb_pess'

  alias_attribute :name, :nm_pess
  alias_attribute :registration, :nr_matr_pess
  alias_attribute :father_name, :nm_gntr
  alias_attribute :mother_name, :nm_gntra
  alias_attribute :born_date, :dt_nasc
  alias_attribute :identification, :nr_rg_milit
  alias_attribute :naturalness, :ds_natur_pess
  alias_attribute :vote_number, :nr_titu_eleit
  alias_attribute :vote_zone, :ds_zona_titu_eleit
  alias_attribute :vote_section, :sg_uf_titu_eleit
  alias_attribute :cpf, :nr_cpf_pess
  alias_attribute :fd, :ds_fator_digit

  belongs_to :sgp_blood_factor, :class_name => 'Sgp::BloodFactor', foreign_key: 'id_fator_sang_fk'
  belongs_to :sgp_blood_type, :class_name => 'BloodType', foreign_key: 'id_tipo_sang_fk'
  has_many :sgp_patent_ascentions, :class_name => 'Sgp::PatentAscention', primary_key: 'id_pess', foreign_key: 'id_pess_fk'

  scope :militaries, -> {joins(:sgp_patent_ascentions ).distinct(:nr_matr_pess)}

  def find_military(registration)
    User.includes(:sgp_patent_ascentions).distinct(:nr_matr_pess).where(:registration)
  end

  def born_date_formated
    born_date.strftime("%d/%m/%Y")
  end

  def register_and_name
    "#{self.registration} #{self.name}"
  end

  def readonly?
    true
  end

end