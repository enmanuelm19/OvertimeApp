namespace :notification do
  desc "Sends SMS notifications to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip admin users
    # 4. Send message that has instructions and a link to log time
    # 5. Do validations for phone number
    puts "I'm in rake task"
  end

end
