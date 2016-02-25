require 'securerandom'

def uuid_generator
  p SecureRandom.uuid
end

10.times do
  uuid_generator
end
