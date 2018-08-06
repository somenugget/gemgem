module Thing::Cell
  class Card < Trailblazer::Cell
    property :name
    property :description
    property :created_at

    def show
      render
    end
  end

  class Cards < Trailblazer::Cell
    def show
      render
    end

    private

    def things
      @things ||= Thing.order(created_at: :desc).all
    end
  end
end
