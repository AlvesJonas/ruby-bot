module FaqModule
  class RemoveService
    def initialize(params)
      @params = params
      @id = params["id"]
    end


    def call
      faq = Faq.find_by(id: @id)
      return "Questão inválida, verifique o Id" if faq == nil
      
      Faq.transaction do
        faq.hashtags.each do |h|
          if h.faqs.count <= 1
            h.delete
          end
        end
        faq.delete
        "Deletado com sucesso"
      end
    end
  end
end