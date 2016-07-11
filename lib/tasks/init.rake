namespace :init do

  task :seed_shifts => :environment do
    Shift.delete_all
    Station.all.each do |loc|
      (8..20).step(2) do |n|
        start_time = DateTime.new(2016, 7, 22, n, 0, 0)
        end_time = start_time + 2.hours
        Shift.create(:station=>loc, :start_time => start_time, :end_time => end_time)
      end

    end


  end

  task :seed_stations => :environment do
    Station.delete_all
    Station.create(:name=>'Healing Arts Tent', :tables => 3, :roamers => 4)
    Station.create(:name=>'Grandstand', :tables => 3, :roamers => 4)
    Station.create(:name=>'Infield', :tables => 3, :roamers => 4)

  end

  task :add_table_limits => :environment do
    Station.all.each do |sta|
      sta.shifts.each do |shift|
        shift.table_max = sta.tables
        shift.roamer_max = sta.roamers
        shift.save
      end
    end
  end

end