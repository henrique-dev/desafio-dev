module Api
  module V1
    class StoresController < ApiController
      before_action :set_store, only: %i[show]

      def index
        @stores = Store.order(created_at: :desc).page(params[:page])

        render :index, status: :ok
      end

      def show
        render :show, status: :ok
      end

      private

      def set_store
        @store = Store.find(params[:id])
      end
    end
  end
end
