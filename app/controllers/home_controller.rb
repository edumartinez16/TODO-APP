# frozen_string_literal: true

# Controller for the index page
class HomeController < ApplicationController
  # Function to render the main layout
  def index
    render layout: 'application2'
  end
end
