require File.dirname(__FILE__) + '/authorize_net'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    class EprocessingNetworkGateway < AuthorizeNetGateway
      #self.live_url = self.test_url = 'https://www.eProcessingNetwork.Com/cgi-bin/an/order.pl'

      self.live_url = 'https://www.eProcessingNetwork.Com/cgi-bin/an/order.pl'
      self.test_url = 'https://www.eprocessingnetwork.com/cgi-bin/Reflect/transact.pl?email=clint.talbott@lonestarpayments.com'

      self.homepage_url = 'http://www.eprocessingnetwork.com/'
      self.display_name = 'eProcessingNetwork'

      # Limit support to purchase() for the time being
      # JRuby chokes here
      # undef_method :authorize, :capture, :void, :credit

      #undef_method :authorize
      #undef_method :capture
      #undef_method :void
      #undef_method :credit

      def test?
        Base.gateway_mode == :test
      end

      private
      # some options in case response needs to be split differently
      #def split(response)
      # like securepay, by comma
      #  response.split(',')
      # by pipe
      #  response.split('|')
      # like authorize.net and eprocessing_network
      #  response[1..-2].split(/\$,\$/)
      #end
    end
  end
end
