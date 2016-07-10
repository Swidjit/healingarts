class PagesController < ApplicationController

  def home
    if user_signed_in?
      @shifts = current_user.shifts
    end
  end

  def index

    @title = params[:page_name].titleize

    render params[:page_name]
  end

  def sitemap

  end

end
