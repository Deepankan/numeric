class DashboardsController < ApplicationController
  def index
    @computers = Computer.all.paginate(page: params[:page], per_page: 5)
  end
end