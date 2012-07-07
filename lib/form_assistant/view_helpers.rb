module RPH
  module FormAssistant
    # methods that mix into ActionView::Base
    module ViewHelpers
    private
      # used to ensure that the desired builder gets set before calling #form_for()
      def form_for_with_builder(record_or_name_or_array, builder, *args, &proc)
        options = args.extract_options!
        # hand control over to the original #form_for()
        form_for(record_or_name_or_array, *(args << options.merge!(:builder => builder)), &proc)
      end

      # determines if binding is needed for #concat()
      # (Rails 2.2.0 and greater no longer requires the binding)
      def binding_required
        RPH::FormAssistant::Rules.binding_required?
      end

    public
      # easy way to make use of FormAssistant::FormBuilder
      #
      # <% form_assistant_for @project do |form| %>
      #   // fancy form stuff
      # <% end %>
      def form_assistant_for(record_or_name_or_array, *args, &proc)
        form_for_with_builder(record_or_name_or_array, RPH::FormAssistant::FormBuilder, *args, &proc)
      end

      # (borrowed the #fieldset() helper from Chris Scharf: 
      #   http://github.com/scharfie/slate/tree/master/app/helpers/application_helper.rb)
      #
      # <% fieldset 'User Registration' do %>
      #   // fields
      # <% end %>
      def fieldset(legend, &block)
        locals = { :legend => legend, :fields => capture(&block) }
        partial = render(:partial => "#{RPH::FormAssistant::FormBuilder.template_root}/fieldset.html.erb", :locals => locals)

        # render the fields
        binding_required ? concat(partial, block.binding) : concat(partial)
      end
    end
  end
end
