# frozen_string_literal: true

module Admin
  class SalesController < Admin::BaseController
    def index
      @sales = Sale.all
    end

    def new; end

    def create; end
  end
end
