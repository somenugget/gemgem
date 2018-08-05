module Thing::Cell
  class Edit < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
    include SimpleForm::ActionViewExtensions::FormHelper

    private

    def title
      "Edit #{model.model.name}"
    end
  end
end
