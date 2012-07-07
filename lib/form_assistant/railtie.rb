require 'form_assistant/view_helpers'

module RPH
  module FormAssistant
    class Railtie < Rails::Railtie
      initializer "form_assistant.view_helpers" do |app|
        ActionView::Base.send :include, ViewHelpers
      end
    end 
  end
end

