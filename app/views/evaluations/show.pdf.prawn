pdf.image "#{Rails.root}/app/assets/images/ufabcico.jpg", :scale => 0.3, :at => [10,700]
pdf.text "Bacharelado em Ciência ", :style => :bold, :align => :center, :size => 16
pdf.text "da Computação", :style => :bold, :align => :center, :size => 16

pdf.move_down(50)
pdf.text "Acompanhamento do Processo de Orientação", :style => :bold, :align => :center, :size => 16

	
pdf.move_down(20)

pdf.font "Times-Roman"


pdf.text "Aluno: " + retorna_aluno_por_avalicao(@evaluation.project_id) 

pdf.move_down(30)

pdf.text "1) Contato Presencial: A quantidade e a duração das reuniões presenciais foram
satisfatórias?", :style => :bold
pdf.text @evaluation.answer1
pdf.move_down(10)
pdf.text "2) Contato Virtual: O orientando manteve satisfatoriamente contato virtual com
orientador através de mensagens eletrônicas (e-mails, trocas de documentos, etc) ?", :style => :bold
pdf.text @evaluation.answer2 
pdf.move_down(10)
pdf.text "3) Assiduidade: O orientando compareceu às reuniões de orientação agendadas e
respondeu a mensagens (e-mail) ?", :style => :bold
pdf.text @evaluation.answer3 
pdf.move_down(10)
pdf.text "4) Qualidade: O orientando realizou as atividades previstas relacionadas ao projeto ?", :style => :bold
pdf.text @evaluation.answer4 
pdf.move_down(10)
pdf.text "5) Cronograma: O cronograma de atividades previsto foi seguido?", :style => :bold
pdf.text @evaluation.answer5
pdf.move_down(10)
pdf.text "6) Avaliação Geral: Assinale um dos itens abaixo quanto à qualidade geral do processo
de orientação no período.", :style => :bold
pdf.text @evaluation.answer6
pdf.move_down(10)
pdf.text "7) Observações e Recomendações", :style => :bold
pdf.text @evaluation.answer7



pdf.move_down(20)



pdf.move_down(40)

