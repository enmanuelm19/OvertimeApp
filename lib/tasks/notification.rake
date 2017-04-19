namespace :notification do
  desc "Sends SMS notifications to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      # 1. Schedule to run sunday at 5pm
      # 2. Iterate over all employees
      # 3. Skip admin users
      # 4. Send message that has instructions and a link to log time
      puts "I'm in rake task"
    end
    puts "It's not time yetRa "
  end

  desc "Sends Mail notifications to managers each day to inform of pending overtime requests"
  task manager_email: :environment do
    #iterate over the list of overtime requests submitted
    #2. Check to see if there are any request
    #3. Iterate overt the list of admin users
    #4. Send the email to each manager/admin user
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
    puts "I'm in rake task mail"
  end
end
