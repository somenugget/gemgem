require 'reform'
require 'reform/form/dry'

module Comment::Contract
  class Create < Reform::Form
    include Dry

    property :body
    property :weight
    property :thing_id

    validation do
      required(:body).filled
      required(:thing_id).filled
    end
  end
end
