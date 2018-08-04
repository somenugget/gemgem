require 'reform'
require 'reform/form/dry'

module Thing::Contract
  class Create < Reform::Form
    include Dry

    property :name
    property :description

    validation do
      required(:name).filled
      required(:description).filled
    end
  end
end
