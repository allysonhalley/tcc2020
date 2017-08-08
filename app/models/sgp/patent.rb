class Sgp::Patent < ActiveRecord::Base
  establish_connection(:ovrsgp)
  self.table_name ='ovrsgp.tb_cargo'

  alias_attribute :name, :ds_cargo
  alias_attribute :abreviation, :sg_cargo
  alias_attribute :hierarchy_level, :ds_hiera_cargo

  def readonly?
    true
  end
end