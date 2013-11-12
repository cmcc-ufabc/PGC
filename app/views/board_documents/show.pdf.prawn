pdf.image "#{Rails.root}/app/assets/images/ufabcico.jpg", :scale => 0.3, :at => [10,700]
pdf.text "Bacharelado em Ciência ", :style => :bold, :align => :center, :size => 16
pdf.text "da Computação", :style => :bold, :align => :center, :size => 16

pdf.move_down(50)
pdf.text "ATA DE DEFESA", :style => :bold, :align => :center, :size => 16

	
pdf.move_down(20)

pdf.font "Times-Roman"

texto = "Na data de " + @board_document.date.to_s_br() + ", às " + @board_document.time.to_s(:time) + ", na " + @board_document.location + " da " +
@board_document.location2+ " em " + @board_document.city + " foi realizada a defesa de " + disciplina_projeto(@board_document.project_id) + " do discente " +
aluno_projeto( @board_document.project_id ).to_s() + ", de título " + titulo_projeto( @board_document.project_id ) +
 ". Esteve presente avaliando o trabalho a banca examinadora composta pelos professores: " + board_projeto( @board_document.project_id ) + 
 ". Após apresentação do trabalho pelo discente e arguição da banca examinadora, o seu trabalho foi considerado:"

pdf.text texto,   :align => :justify, :font => :times_new_roman, :size => 12

pdf.move_down(20)

pdf.text @board_document.approval + @board_document.mark

pdf.move_down(40)

pdf.text @board_document.city + ", " + @board_document.date.to_s_br,  :align => :right