class StoresController < ApplicationController
  before_action :set_store, only: %i[show]

  def index
    @stores = Store.order(created_at: :desc).page(params[:page])
  end

  def show
    @movements = @store.movements.order(created_at: :desc).page(params[:page])
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
