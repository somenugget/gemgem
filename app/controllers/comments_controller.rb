class CommentsController < ApplicationController
  def create
    run Comment::Create do |result|
      return redirect_to result[:model].thing
    end

    render cell(Thing::Cell::Show,
                Thing::Show.call(params: { id: params[:comment][:thing_id] })[:model],
                comment_form: @form)
  end
end
