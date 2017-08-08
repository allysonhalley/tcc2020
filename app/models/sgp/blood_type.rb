class Sgp::BloodType < ActiveRecord::Base
  establish_connection(:ovrsgp)
  self.table_name ='ovrsgp.tb_tipo_sang'

  alias_attribute :name, :ds_tipo_sang

  def readonly?
    true
  end
end