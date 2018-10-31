class MailerJob < ApplicationJob
  rescue_from(ErrorLoadingSite) do
    retry_job wait: 5.minutes, queue: :low_priority 
  end 
  #queue_as :default

  def perform(*args)
    # Do something later
  end
end
