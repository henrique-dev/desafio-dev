class ImportersController < ApplicationController
  before_action :set_importer, only: %i[show]
  def index
    @importers = Importer.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @importer = Importer.new
    @errors = {}
  end

  def create
    @success, @importer, @errors = CreateImporterService.call(params: post_params).result

    if @success
      redirect_to importers_path, notice: 'Importer was successfully created.'
    else
      render :new, status: :unprocessable_entity
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
