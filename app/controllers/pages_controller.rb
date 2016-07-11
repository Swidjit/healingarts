class PagesController < ApplicationController

  def home
    if user_signed_in?
      @shifts = current_user.shifts
      if current_user.needs_table
        @available_shifts = Shift.where('shifts.table_count < shifts.table_max')
        puts @available_shifts.count
      else
        @available_shifts = Shift.where('shifts.table_count < shifts.table_max OR shifts.raomer_count < shifts.roamer_max')
      end
    end
  end

  def index

    @title = params[:page_name].titleize

    render params[:page_name]
  end

  def sitemap

  end

end
