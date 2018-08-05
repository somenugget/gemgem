class ThingsController < ApplicationController
  def new
    run Thing::Create::Present
    render cell(Thing::Cell::New, @form)
  end

  def create
    run Thing::Create do |result|
      return redirect_to result[:model]
    end

    render cell(Thing::Cell::New, @form)
  end
end
