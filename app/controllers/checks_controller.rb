class ChecksController < ApplicationController
  def new
    check_params = { transactional: true, kv_store: true }
    @checks = CheckDatabase.new(check_params).call
  rescue ArgumentError => error
    render json: {
      message: error.message,
      error: error.backtrace
    }
  end
end
