class ImportersController < ApplicationController
  before_action :set_importer, only: %i[show]
  def index
    @importers = Importer.page(params[:page])
  end

  def show; end

  def new
    @importer = Importer.new
    @errors = {}
  end

  def create
    @success, @importer, @errors = CreateImporterService.call(params: post_params).result

    respond_to do |format|
      if @success
        format.html { redirect_to importers_path, notice: "Importer was successfully created." }
        format.json { render :show, status: :created, location: @importer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { errors: @errors }, status: :unprocessable_entity }
      end
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
