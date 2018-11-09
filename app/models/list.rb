# frozen_string_literal: true

# Model for the Lists
class List < ApplicationRecord
  # Setting the relations
  belongs_to :user
  has_many :tasks
  validates :name, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  # Function to set the csv information
  def self.to_csv
    attributes = %w[name tasks_descriptions]
    headers = %w[list tasks]
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |list|
        csv << attributes.map { |attr| list.send(attr) }
      end
    end
  end

  # Function to get the tasks for every list
  def tasks_descriptions
    descriptions = []
    tasks.each do |task|
      descriptions.push(task.description)
    end
    descriptions.join(', ')
  end
end
