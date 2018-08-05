class ThingsController < ApplicationController
  def index
    run Thing::Index

    render cell(Thing::Cell::Index, result[:models])
  end

  def show
    run Thing::Show

    render cell(Thing::Cell::Show, result[:model])
  end

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

  def edit
    run Thing::Update::Present

    render cell(Thing::Cell::Edit, @form)
  end

  def update
    run Thing::Update do |result|
      flash[:notice] = "#{result[:model].name} has been updated"
      return redirect_to result[:model]
    end

    render cell(Thing::Cell::Edit, @form)
  end

  def destroy
    run Thing::Delete

    flash[:alert] = 'Thing was removed'
    redirect_to things_path
  end
end
