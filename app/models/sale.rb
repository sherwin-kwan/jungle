class Sale < ActiveRecord::Base
  def over?
    return ends_on < Date.current
  end

  def future?
    return starts_on > Date.current
  end

  def active?
    return starts_on < Date.current && self.ends_on > Date.current
  end

  # Class methods

  def self.active_sales
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
end
