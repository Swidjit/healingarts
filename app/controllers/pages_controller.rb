class PagesController < ApplicationController

  def home
    if user_signed_in?
      @shifts = current_user.shifts.order(:start_time)
      if ['Chiropractor','Massage Therapist'].include?(current_user.skill)

        if current_user.needs_table
          @available_shifts = Shift.where('shifts.table_count < shifts.table_max')
          puts @available_shifts.count
        else
          @available_shifts = Shift.where('shifts.table_count < shifts.table_max OR shifts.roamer_count < shifts.roamer_max')
        end
      else

        if current_user.needs_table
          @available_shifts = Shift.where('shifts.table_count < shifts.table_max').where('shifts.station_id = 11')
          puts @available_shifts.count
        else
          @available_shifts = Shift.where('shifts.table_count < shifts.table_max OR shifts.roamer_count < shifts.roamer_max').where('shifts.station_id = 11')
        end
      end
    else
      @new_user = true
    end

  end

  def index

    @title = params[:page_name].titleize

    render params[:page_name]
  end

  def sitemap

  end

end
