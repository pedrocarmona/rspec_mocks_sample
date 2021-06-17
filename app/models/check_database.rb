class CheckDatabase
  def initialize(transactional:, kv_store:)
    @transactional = transactional
    @kv_store = kv_store
  end

  def call
    {
      transactional: transactional,
      kv_store: kv_store
    }
  end

  private

  attr_accessor :transactional, :kv_store
end
