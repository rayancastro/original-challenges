require 'date'


def age_in_days(day, month, year)
  birthday = Date.new(year, month, day)
  current = Date.today
  return (current.jd - birthday.jd).to_i
end
