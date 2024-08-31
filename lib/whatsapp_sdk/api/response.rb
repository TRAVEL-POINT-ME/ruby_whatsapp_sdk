# frozen_string_literal: true

require_relative "responses/message_data_response"
require_relative "responses/phone_number_data_response"
require_relative "responses/phone_numbers_data_response"
require_relative "responses/read_message_data_response"
require_relative "responses/message_error_response"
require_relative "responses/business_profile_data_response"

module WhatsappSdk
  module Api
    class Response
      attr_accessor :error, :data, :raw_response

      def initialize(response:, data_class_type:, error_class_type: Responses::MessageErrorResponse)
        @raw_response = response
        @data = data_class_type.build_from_response(response: response)
        @error = error_class_type.build_from_response(response: response)
      end

      # @return [Boolean] Whether or not the response is successful.
      def ok?
        @error.nil?
      end

      # @return [Boolean] Whether or not the response has an error.
      def error?
        !!@error
      end
    end
  end
end
