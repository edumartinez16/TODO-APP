class MailerJob < ApplicationJob
  rescue_from(ErrorLoadingSite) do
    retry_job wait: 5.minutes, queue: :low_priority 
  end 
  #queue_as :default
  def perform(*args)
    # Do something later
    @user = args[1]
    ApplicationMailer.sample_email(@user).deliver_later(wait_until: 1.minutes.from_now)
  end
end
