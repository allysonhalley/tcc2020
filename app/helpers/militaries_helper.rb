module MilitariesHelper

    # return Registration and Name
    def self.register_name(registration)
        military = Military.find_by_registration(registration)
        military.register_and_name
    end

end
