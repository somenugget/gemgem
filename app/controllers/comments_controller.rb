class CommentsController < ApplicationController
  def create
    byebug
    run Comment::Create do |result|
      return redirect_to result[:model].thing
    end

    render cell(Thing::Cell::Show,
                Thing::Show.call(params: { id: params[:comment][:thing_id] })[:model])
  end
end
