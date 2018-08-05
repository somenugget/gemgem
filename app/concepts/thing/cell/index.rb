module Thing::Cell
  class Index < Trailblazer::Cell
    include ActionView::RecordIdentifier

    private

    def new_thing_link
      link_to 'New thing', new_thing_path
    end
  end
end
