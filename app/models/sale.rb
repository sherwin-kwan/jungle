# frozen_string_literal: true

class Sale < ApplicationRecord
  def over?
    ends_on < Date.current
  end

  def future?
    starts_on > Date.current
  end

  def active?
    starts_on < Date.current && ends_on > Date.current
  end

  # Class methods

  def self.active_sales
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
end
