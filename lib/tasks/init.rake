namespace :init do

  task :seed_shifts => :environment do
    Shift.delete_all
    (21..24).step(1) do |day|
      Station.all.each do |loc|
        a = loc.hours[0].split('-')[0].to_i
        b = loc.hours[0].split('-')[1].to_i
        puts a,b
        (a..b).step(2) do |n|
          start_time = DateTime.new(2016, 7, day, n, 0, 0)
          end_time = start_time + 2.hours
          Shift.create(:station=>loc, :start_time => start_time, :end_time => end_time, :table_max=> loc.tables, :roamer_max =>loc.roamers)
        end

      end
    end


  end

  task :seed_stations => :environment do
    Station.delete_all
    Station.create(:name=>'Healing Arts Tent', :tables => 4, :roamers => 3, :hours => ['16-21','13-21','14-21','9-18'])
    Station.create(:name=>'Grandstand', :tables => 2, :roamers => 2, :hours => ['15-24','9-24','9-24','12-18'])
    Station.create(:name=>'Infield', :tables => 1, :roamers => 1, :hours => ['15-24','9-24','9-24','10-24'])

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