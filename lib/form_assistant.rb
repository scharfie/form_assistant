require 'form_assistant/error'
require 'form_assistant/field_errors'
require 'form_assistant/rules'
require 'form_assistant/form_builder'
require 'form_assistant/view_helpers'

ActionView::Base.send :include, RPH::FormAssistant::ViewHelpers
