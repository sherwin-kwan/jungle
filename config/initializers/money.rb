Money.locale_backend = :currency
Money.default_currency = Money::Currency.new("CAD")
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

MoneyRails.configure do |config|
  config.no_cents_if_whole = false
  # config.default_format = {
  #   no_cents_if_whole: nil,
  #   symbol: nil,
  #   sign_before_symbol: nil
  # }
end
