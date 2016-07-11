class ShiftsController < ApplicationController

  def select
    @shift = Shift.find(params[:id])
    @shifts = current_user.shifts
    if current_user.shifts.include?(@shift)

      current_user.shifts.delete(@shift)
      @user_hours = current_user.shifts.count*2
      if current_user.needs_table
        @shift.decrement!(:table_count)
      else
        @shift.decrement!(:roamer_count)
      end
      if current_user.shifts.count == 5
        render 'unfilled'
      else
        render 'unselect'
      end

    else
      current_user.shifts << @shift
      @user_hours = current_user.shifts.count*2
      if current_user.needs_table
        @shift.increment!(:table_count)
      else
        @shift.increment!(:roamer_count)
      end
      if current_user.shifts.count == 6
        render 'filled'
      end

    end

  end

end
