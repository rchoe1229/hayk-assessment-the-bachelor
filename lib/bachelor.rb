require 'pry'

def all_contestants(data)
    data.values.flatten # .values will give you all the values (key = seasons, values = array of contestants) .flatten will combine all the arrays of the values
end

def get_first_name_of_season_winner(data, season)
    contestant = data[season].find do |winners|
        winners["status"] == "Winner"
    end
    contestant["name"].split[0]
end

def get_contestant_name(data, occupation)
    all_contestants(data).find do |contestant|
        contestant["occupation"] == occupation
    end["name"]
end

def count_contestants_by_hometown(data, hometown)
    all_contestants(data).count do |contestant|
    contestant["hometown"] == hometown
    # .reduce Method
    # all_contestants(data).reduce(0) do |acc, contestant|
    # contestant["hometown"] == hometown ? acc + 1 : acc
    end
end

def get_occupation(data, hometown)
    # occupation = ""
    # data.each do |seasons, contestants_info|
    #     contestants_info.find do |contestant|
    #         if
    #             contestant["hometown"] == hometown
    #             occupation = contestant["occupation"]
    #         end
    #     end
    # end
    # occupation
  contestant_hometown = all_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant_hometown["occupation"]
end

def get_average_age_for_season(data, season)
  contestant_age = data[season].map do |contestants_info|
    contestants_info["age"].to_i
    end
  (contestant_age.sum / contestant_age.count.to_f).round
end