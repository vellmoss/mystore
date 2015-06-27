class MstoresController < ApplicationController
  before_action :set_mstore, only: [:show, :edit, :update, :destroy]

  respond_to  :json, :only => :index
  # respond_to :html, :xml, :json

  # GET /mstores
  # GET /mstores.json

  def index
    @mstores = Mstore.all
  end

  # GET /mstores/1
  # GET /mstores/1.json
  def show
  end

  # GET /mstores/new
  def new
    @mstore = Mstore.new
  end

  # GET /mstores/1/edit
  def edit
  end

  # POST /mstores
  # POST /mstores.json
  def create
    @mstore = Mstore.new(mstore_params)

    respond_to do |format|
      if @mstore.save
        format.html { redirect_to @mstore, notice: 'Mstore was successfully created.' }
        format.json { render :show, status: :created, location: @mstore }
      else
        format.html { render :new }
        format.json { render json: @mstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mstores/1
  # PATCH/PUT /mstores/1.json
  def update
    respond_to do |format|
      if @mstore.update(mstore_params)
        format.html { redirect_to @mstore, notice: 'Mstore was successfully updated.' }
        format.json { render :show, status: :ok, location: @mstore }
      else
        format.html { render :edit }
        format.json { render json: @mstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mstores/1
  # DELETE /mstores/1.json

  def destroy
    @mstore.destroy
    respond_to do |format|
      format.html { redirect_to mstores_url, notice: 'Mstore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mstore
      @mstore = Mstore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mstore_params
      params.require(:mstore).permit(:position, :price)
    end
end
