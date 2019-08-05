class CardsTopPdf < Prawn::Document
  def initialize(cards)
    super(:page_size => 'A5', :page_layout => :landscape)
    mount_print(cards)
    render_file "./public/asset/pdfs/#{Time.current.strftime('%d-%m-%Y-%H-%M ')}.pdf"
  end

  def mount_print(cards)
    #Card box [-16, 758] Util area
    bounding_box([-16, 350], :width => 544, :height => 368.5) do
      cards.each_with_index do |card, index|
        if index > 0 && index%2 == 0
          start_new_page
        end
        position(index%2, card)
      end
    end
  end

  def position(position, card)

    case position
      when 0
        bounding_box([-16, 376.5], :width => 272, :height => 368.5){insert_card(card)}
      when 1
        bounding_box([256, 376.5], :width => 272, :height => 368.5){insert_card(card)}
    end
  end

  def insert_card(card)
    #Front box
    bounding_box([34,340.5], :width => 256.5, :height => 171.5)  do
      #Name box
      text_box "#{card.name}", :at => [17,115],
               :align => :center,
               :valign => :center,
               :width => 144,
               :height => 34,
               :size => 8

      #Patent box
      text_box "#{card.patent}", :at => [17,75],
               :align => :center,
               :valign => :center,
               :width => 144,
               :height => 17,
               :size => 8

      #Photo box
      image "./public/asset/images/military/#{card.registration}.jpg", :at => [167,157],
            :position => :center,
            :valign => :center,
            :width => 71,
            :height => 82.5

      #Register box
      text_box "#{card.identification}", :at => [167, 70],
               :align => :center,
               :valign => :center,
               :width => 71,
               :height => 17,
               :size => 8
    end

    #Back box
    bounding_box([34,159], :width => 256.5, :height => 171.5) do

      #Father name
      text_box "#{card.father_name}", :at => [38,154],
               :align => :left, :valign => :bottom,
               :width => 203,
               :height => 8,
               :size => 8

      #Mother name
      text_box "#{card.mother_name}", :at => [38,144],
               :align => :left, :valign => :bottom,
               :width => 203,
               :height => 8,
               :size => 8

      #Born date
      text_box "#{card.born_date}", :at => [23,132],
               :align => :center, :valign => :bottom,
               :width => 68,
               :height => 14,
               :size => 8

      #Registration
      text_box "#{card.registration}", :at => [91,132],
               :align => :center, :valign => :bottom,
               :width => 68,
               :height => 14,
               :size => 8

      #Right thumb
      text_box "THUMB", :at => [159,132],
               :width => 79,
               :height => 68,
               :align => :center,
               :valign => :center

      #Blood type
      text_box "#{card.blood_type}", :at => [159,66],
               :width => 28,
               :height => 14,
               :size => 8,
               :align => :center,
               :valign => :bottom

      #Blood factor
      text_box "#{card.blood_factor}", :at => [187,66],
               :width => 51,
               :height => 14,
               :size => 8,
               :align => :center,
               :valign => :bottom

      #Naturalness
      text_box "#{card.naturalness}", :at => [23,116],
               :align => :center,
               :valign => :bottom,
               :width => 136,
               :height => 14,
               :size => 8

      #Vote number
      text_box "#{card.vote_number}", :at => [23,100],
               :align => :center,
               :valign => :bottom,
               :width => 68,
               :height => 14,
               :size => 8

      #Vote zone
      text_box "#{card.vote_zone}", :at => [92,100],
               :align => :center,
               :valign => :bottom,
               :width => 39.5,
               :height => 14,
               :size => 8

      #Vote section
      text_box "#{card.vote_section}", :at => [130.5,100],
               :align => :center,
               :valign => :bottom,
               :width => 28,
               :height => 14,
               :size => 8

      #CPF
      text_box "#{card.cpf}", :at => [23,84],
               :align => :center,
               :valign => :bottom,
               :width => 93.5,
               :height => 14,
               :size => 8

      #FD
      text_box "#{card.fd}", :at => [116.5,84],
               :align => :center,
               :valign => :bottom,
               :width => 42.5,
               :height => 31,
               :size => 8

      #Print locale and date
      text_box "#{card.print_locale_date}", :at => [23,68],
               :align => :center,
               :valign => :bottom,
               :width => 93.5,
               :height => 14,
               :size => 8

      #Expire date
      text_box "#{card.expire_date}", :at => [159,38],
               :align => :center,
               :valign => :bottom,
               :width => 79,
               :height => 14,
               :size => 8
    end
  end

end