class MovementsController < ApplicationController
  before_action :set_store
  before_action :set_movement, only: %i[ show ]
  def index
    @movements = @store.movements.order(created_at: :desc).page(params[:page])
  end

  def show; end

  private
    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_movement
      @movement = @store.movements.find(params[:id])
    end
end
