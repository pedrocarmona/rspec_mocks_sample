class ChecksController < ApplicationController
  def new
    @checks = CheckDatabase.new(transactional: true, kv_store: true).call
  end
end
