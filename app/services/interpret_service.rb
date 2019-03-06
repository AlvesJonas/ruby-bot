class InterpretService
  def self.call action, params
    case action
    when "list", "search", "search_by_hashtag"
      FaqModule::ListService.new(params, action).call()
    when "create"
      FaqModule::CreateService.new(params).call()
    when "remove"
      FaqModule::RemoveService.new(params).call()
    when "help"
      HelpService.call()
    when "translate"
      LanguageModule::TranslateService.params(params).call()
    when "translate_with_source"
      LanguageModule::TranslateWithSourceService.params(params).call()
    else
      "Não compreendi o seu desejo"
    end
  end
end