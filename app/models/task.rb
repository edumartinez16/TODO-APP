# frozen_string_literal: true

# Model for the Tasks
class Task < ApplicationRecord
  # Setting the relations
  belongs_to :list
end
