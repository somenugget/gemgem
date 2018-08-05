module Thing::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier

    private

    def title
      model.name
    end

    def description
      model.description
    end

    def things_link
      link_to 'All things', things_path
    end
  end
end
