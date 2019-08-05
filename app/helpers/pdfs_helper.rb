# Class manipulacao de pdfs
module PdfsHelper

    def self.gen_pdfs
        cards = CardRequest.all.select(:id).take(4)
        @pdf = CardsPdf.new(cards)
    end

end