require_relative './electrum/transaction.rb'
require_relative './electrum/address.rb'
require_relative './electrum/history.rb'
require_relative './shape_shift/shift.rb'
require_relative './shape_shift/status.rb'
require 'json'
require 'awesome_print'
require 'logger'
require 'dotenv'

Dotenv.load

WITHDRAW_ADDRESS = ENV['WITHDRAW_ADDRESS']
RETURN_ADDRESS = ENV["RETURN_ADDRESSES"].split.sample

logger = Logger.new('development.log')

# ap Electrum::History::unconfirmed
ap ShapeShift::status address: ENV["DEPOSIT_ADDRESS"]

# ss_withdraw_request = ShapeShift::Shift.new(
#   from: 'BTC',
#   to: 'ETH',
#   withdrawAddress: HOLDING_ADDRESS,
#   returnAddress: RETURN_ADDRESS
# ).request
#
# ap ss_withdraw_request
# logger.info(ss_withdraw_request)
#
# transaction_history = Electrum::Transaction.new(
#   to: ss_withdraw_request["deposit"],
#   amount: 0.001,
#   password: ENV["PASSWORD"]
# ).send
#
# ap transaction_history
# logger.info(transaction_history)
