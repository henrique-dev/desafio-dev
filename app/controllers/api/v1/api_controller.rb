module Api
  module V1
    class ApiController < ActionController::API
      before_action :authenticate

      def authenticate
        render_unauthorized if ENV['API_SECRET'].nil?
        render_unauthorized if ENV['API_SECRET'] != authorization
      end

      private

      def authorization
        request.headers['Authorization']
      end

      def render_unauthorized
        render(json: { errors: { credentials: ['is not valid'] } }, status: :unauthorized)
      end
    end
  end
end
