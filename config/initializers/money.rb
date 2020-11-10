
MoneyRails.configure do |config|

  config.default_currency = :gbp
  config.no_cents_if_whole = false
    # config.default_format = {
  #   no_cents_if_whole: nil,
  #   symbol: nil,
  #   sign_before_symbol: nil
  # }
end