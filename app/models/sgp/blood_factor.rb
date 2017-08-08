class Sgp::BloodFactor < ActiveRecord::Base
  establish_connection(:ovrsgp)
  self.table_name ='ovrsgp.tb_fator_sang'

  alias_attribute :name, :ds_fator_sang

  def readonly?
    true
  end
end