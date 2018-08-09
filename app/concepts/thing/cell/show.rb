module Thing::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier

    property :name, :description

    private

    def things_link
      link_to 'All things', things_path
    end
  end
end
