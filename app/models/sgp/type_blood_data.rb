class Sgp::TypeBloodData < ApplicationRecord
	establish_connection(:db_portal_sistemas_prod)
    self.table_name = 'ovrsgp.tb_tipo_sang'
end