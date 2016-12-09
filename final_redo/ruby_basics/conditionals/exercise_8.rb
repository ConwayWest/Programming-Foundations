status = ['awake', 'tired'].sample

output = if status == 'awake'
           'Be productive!'
         else
           'Go to sleep!'
         end
puts output
