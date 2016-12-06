require_relative './bootstrap.rb'

logger = Logger.new('development.log')

ss_withdraw_request = ShapeShift::Shift.new(
  from: 'BTC',
  to: 'ETH',
  withdraw_address: ENV['WITHDRAW_ADDRESS'],
  return_address: ENV["RETURN_ADDRESSES"].split.sample
).request

ap ss_withdraw_request
logger.info(ss_withdraw_request)

transaction_history = Electrum::Transaction.new(
  to: ss_withdraw_request["deposit"],
  amount: 0.005,
  password: ENV["PASSWORD"]
).send

ap transaction_history
logger.info(transaction_history)
