class StoresController < ApplicationController
  before_action :set_store, only: %i[ show ]

  def index
    @stores = Store.page(params[:page])
  end

  def show; end

  private
    def set_store
      @store = Store.find(params[:id])
    end
end
