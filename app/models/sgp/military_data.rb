class Sgp::MilitaryData < ApplicationRecord
	establish_connection(:db_portal_sistemas_prod)
	self.table_name = 'ovrsgp.tb_pess'

	alias_attribute :id, :id_pess
	alias_attribute :name, :nm_pess
	alias_attribute :war_name, :nm_guerr
	alias_attribute :registration, :nr_matr_pess
	alias_attribute :born_date, :dt_nasc
	alias_attribute :identification, :nr_rg_milit
	alias_attribute :father_name, :nm_gntr
	alias_attribute :mother_name, :nm_gntra
	alias_attribute :vote_number, :nr_titu_eleit
	alias_attribute :vote_section, :ds_secao_titu_eleit
	alias_attribute :vote_zone, :ds_zone_titu_eleit	
	alias_attribute :cpf, :nr_cpf_pess
	alias_attribute :naturalness, :ds_natur_pess   
	alias_attribute :blood_type
	alias_attribute :blood_factor
    
	# Cached function
	def self.fetch_all
		Rails.cache.fetch(["military_datas", __method__], expires_in: 2.hours) do
			connection.select_all <<-SQL
				SELECT pess.id_pess AS id,
				pess.nm_pess, pess.nm_guerr, pess.nr_matr_pess, cargo.sg_cargo,
				CONCAT(cargo.sg_cargo, ' - ',pess.nm_pess, ' - ', pess.nr_matr_pess) AS custom_name
				FROM ovrsgp.tb_pess AS pess
				JOIN ovrsgp.tb_prom AS prom ON prom.id_pess_fk = pess.id_pess
				JOIN ( SELECT id_pess_fk, MAX(dt_prom) AS dt_prom 
					FROM ovrsgp.tb_prom 
					GROUP BY id_pess_fk) AS aux_prom
				ON aux_prom.id_pess_fk = prom.id_pess_fk
				AND aux_prom.dt_prom = prom.dt_prom
				JOIN ovrsgp.tb_cargo AS cargo
				ON cargo.id_cargo = prom.id_cargo_fk
				ORDER BY cargo.ds_hiera_cargo  
			SQL
		end
	end
end