require 'reform/form/active_model/validations'

Reform::Form::ActiveModel::Validations::Result::ResultErrors.class_eval do
  def full_messages_for(attribute)
    self[attribute].map do |error|
      @amv_errors.full_message attribute, error
    end
  end
end
