class MstoresController < ApplicationController

  before_action :set_mstore, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

    respond_to  :json, :only => :index
  # respond_to :html, :xml, :json

  # GET /mstores
  # GET /mstores.json

  def index
    @d1 = params[:d1] #'2015-06-15'
    @d2 = params[:d2] #'2015-07-01'    #d1 = '15-06-2015', d2 = '01-07-2015'    #.to_s(:db)   #'2015-06-15'..'2015-07-01'
    if @d2 == "" or @d2 == nil or @d1 == "" or @d1 == nil or @d2 == "NaN" or @d1 == "NaN"
      #@d1 = $("#st").val()
      #@d2 = $("#fi").val()
      @mstores = Mstore.last(33)
    else
      @mstores = Mstore.where(updated_at: (@d1..@d2))
    end

    logger.debug "d1 = #{params[:d1].inspect} attr_par @d1 = #{@d1}"
    logger.debug "d2 = #{params[:d2].inspect} attr_par @d2 = #{@d2}"
    logger.debug @mstores.inspect
    #@mstores = Mstore.all

  end

  # GET /mstores/1
  # GET /mstores/1.json
  def show
    # делаю что-то @mstores = ....
    #render :action => "index"
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
