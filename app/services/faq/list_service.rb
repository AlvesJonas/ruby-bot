module FaqModule
  class ListService
    def initialize(params, action)
      @action = action
      @query = params["query"]
    end


    def call
      if @action == "search"
        faqs = Faq.search(@query)
      elsif @action == "search_by_hashtag"
        #TODO fazer teste passar com esse código
        #faqs = Hashtag.where(name: @query).includes(:faqs).inject([]) do |faqs, hashtag|
          #faqs << hashtag.faqs
        #end.uniq
        Faq.all.each do |faq|
          faq.hashtags.each do |hashtag|
            faqs << faq if hashtag.name == @query
          end
        end
      else
        faqs = Faq.all
      end

      response = "*Perguntas e Respostas* \n\n"
      faqs.each do |f|
        response += "*#{f.id}* - "
        response += "*#{f.question}*\n"
        response += "`#{f.answer}` \n"
        f.hashtags.each do |h|
          response += "_##{h.name}_ "
        end
        response += "\n\n"
      end
      (faqs.count > 0)? response : "Nada encontrado"
    end
  end
end