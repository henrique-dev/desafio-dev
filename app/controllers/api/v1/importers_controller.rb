module Api
  module V1
    class ImportersController < ApiController
      before_action :set_importer, only: %i[show]
      def index
        @importers = Importer.order(created_at: :desc).page(params[:page])

        render :index, status: :ok
      end

      def show
        render :show, status: :ok
      end

      def create
        success, @importer, errors, = CreateImporterService.call(params: post_params).result

        if success
          render :show, status: :created
        else
          render json: { errors: }, status: :unprocessable_entity
        end
      end

      private

      def set_importer
        @importer = Importer.find(params[:id])
      end

      def post_params
        params.fetch(:importer, {}).permit(:file)
      end
    end
  end
end
