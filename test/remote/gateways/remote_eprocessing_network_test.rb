require 'test_helper'

class RemoteEprocessingNetworkTest < Test::Unit::TestCase
  def setup
    Base.mode = :test
    @gateway = EprocessingNetworkGateway.new(fixtures(:eprocessing_network))
    @amount = 100
    @credit_card = credit_card('4111111111111111')
    @options = {
      :order_id => generate_unique_id,
      :billing_address => address,
      :description => 'Store purchase'
    }
  end

  def test_successful_purchase
    assert response = @gateway.purchase(@amount, @credit_card, @options)
    assert response.success?
    assert response.test?
    assert_equal 'This transaction has been approved', response.message
    assert response.authorization
  end
end
