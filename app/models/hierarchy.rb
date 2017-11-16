class Hierarchy < ApplicationRecord

    enum rank: {cel: 1, tc: 2, maj: 3, cap: 4, ten1: 5, ten2: 6, asp: 7, cfoa: 8, cfo: 9, sub: 10, sgt1: 11, sgt2: 12, sgt3: 13, cfs: 14, cb: 15, cfc: 16, sd: 17, cfsd: 18}

    # Internationalization (I18n)
    # rank: Internationalization (I18n)
    def i18n_rank
        I18n.t("attributes.hierarchy.ranks.#{rank}")
    end
    # Hash ranks: Internationalization (I18n)
    def self.i18n_ranks(hash = {})
        ranks.keys.each { |key| hash[I18n.t("attributes.hierarchy.ranks.#{key}")] = key }
        hash
    end

    def self.search(search)
        hierarchies = all # for not existing params args
        hierarchies = hierarchies.where("name like ? OR acronym like ?", "%#{search.upcase}%", "%#{search.upcase}%") if search
        @hierarchies = hierarchies
        @hierarchies
      end
    
end
