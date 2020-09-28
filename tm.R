library(tm)
library(wordcloud)

#o texto pode ser adicionado diretamente dentro do objeto dataset, ou, ser referenciado em um arquivo separdo de .txt#
dataset<- "Dos meus 11 anos em enfermagem em empresas públicas ou privadas, nunca me colocaram plano de metas ou sentaram para avaliar o meu trabalho, como eu me comporto, Qual meu perfil profissional, o que que eu posso melhorar, então acredito que a partir do momento que eu tenho um plano de trabalho que eu procuro trabalhar com isso, na verdade  acho que a primeira instituição que a enfermagem trabalhou a questão médica de saúde Mas trabalhar com plano de metas de trabalho aqui no estado que eu conheço. Então isso é ótimo para os profissionais e para a qualidade do serviço. O modelo, se aplicado corretamente, ele permite conhecer e maximizar as habilidades de cada colaborador, com isso é possível até fazer remanejamento na equipe, para melhorar o serviço. O modelo ele permite também a promoção de capacitações que sejam mais eficientes para o colaborador, e um dos grandes diferenciais é que prioriza o trabalho em equipe, e se não for realizado de forma adequada ele reflete inclusive na nota individual do colaborador. Eu acho que alinha as ações de todos e também para o colaborador acho que deixa o colaborador bem ciente de qual é o papel dele dentro da instituição e qual é, como que as atividades dele devem ser direcionadas né, que muitas vezes no serviço público não tem essa padronização dos serviços, e aí quando você tem um método de avaliação que alinha os objetivos da instituição com os objetivos de cada unidade pra refletir nas ações do colaborador, eu acho que deixa, fica mais fácil pro colaborador executar as atividades dele com maior qualidade e ter uma prestação de serviço melhor para a sociedade. Eu acho que é você ter, primeiro, a possibilidade enquanto colaborador de perceber que existe a chance de você acender, né,  de receber treinamento, de isso ter repercussão na sua carreira dentro da empresa e também para empresa de estabelecer programas, metas, objetivos e oferecer assistência melhor, acho que isso acaba, é, beneficiando todo mundo. Até no momento eu não vejo, é, hoje o benefício que tem é o seguinte, que antigamente o gestor aqui era considerado como, era o responsável pela decisão dos colaboradores de progredirem ou não, quando teve essa mudança aí da interpretação da legislação, isso aí amenizou, que era uma guerra, todo mundo queria 10, tá entendendo,  todo mundo queria ganhar 10 porque porque se o chefe, o gestor, não atribuísse uma nota dez ele automaticamente já estava eliminado do processo, já estava excluído do processo, então, é, eu acho que a única melhoria até o momento foi essa."
  
VectorSource(dataset)

review<- VectorSource(dataset)
corpus<- Corpus(review)

corpus<- tm_map(corpus, content_transformer(tolower))
corpus<- tm_map(corpus, removePunctuation)
corpus<- tm_map(corpus, removeWords, stopwords("pt-br"))
corpus<- tm_map(corpus, stemDocument)

dtm<- DocumentTermMatrix(corpus)
dtm2<- as.matrix((dtm))

frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing = TRUE)
print(frequency)

wcloud<- tm_map(corpus, PlainTextDocument)
wordcloud(wcloud, max.words = 50)

write.csv(frequency, "tm-template.csv")
