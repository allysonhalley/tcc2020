module HierarchiesHelper

    # return Hierarchy name
    def self.hierarchy_name(id)
        hierarchy = Hierarchy.find_by_id(id)
        hierarchy.name
    end

end
