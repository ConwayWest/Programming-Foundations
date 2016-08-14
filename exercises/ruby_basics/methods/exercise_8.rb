def sentence(name, activity)
  "#{name} went #{activity} today!"
end

def name(name_array)
  name_array.sample
end

def activity(activity_array)
  activity_array.sample
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
