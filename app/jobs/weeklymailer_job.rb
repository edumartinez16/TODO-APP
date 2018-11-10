class WeeklymailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'weekly mail'
  end
end
