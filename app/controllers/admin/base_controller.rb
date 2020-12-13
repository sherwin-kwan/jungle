# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  end
end
