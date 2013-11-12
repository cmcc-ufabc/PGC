pdf.image "#{Rails.root}/app/assets/images/ufabcico.jpg", :scale => 0.3, :at => [10,700]
pdf.text "Bacharelado em Ciência ", :style => :bold, :align => :center, :size => 16
pdf.text "da Computação", :style => :bold, :align => :center, :size => 16

pdf.move_down(50)
pdf.text "Relatório", :style => :bold, :align => :center, :size => 16

  pdf.move_down(20)
  
  pdf.text "Projetos Concluidos:", :style => :bold, :align => :left, :size => 12
  pdf.move_down(10)
  pdf.table @tabelaConcluido, :row_colors => ["F0F0F0", "FFFFFF"], :cell_style => {:size => 8} do
	cells.padding = 12

    row(0).border_width = 2
    row(0).font_style = :bold
    row(0).style(:align => :center)

 end
 
   pdf.move_down(20)
  
  pdf.text "Projetos Pendentes:", :style => :bold, :align => :left, :size => 12
  pdf.move_down(10)
  pdf.table @tabelaPendente, :row_colors => ["F0F0F0", "FFFFFF"], :cell_style => {:size => 8} do
	cells.padding = 12

    row(0).border_width = 2
    row(0).font_style = :bold
    row(0).style(:align => :center)

 end
  