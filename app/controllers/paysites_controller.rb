class PaysitesController < ApplicationController
  before_action :set_paysite, only: [:show, :edit, :update, :destroy]

  # GET /paysites
  # GET /paysites.json
  def index
    @paysites = Paysite.all
  end

  # GET /paysites/1
  # GET /paysites/1.json
  def show
  end

  # GET /paysites/new
  def new
    @paysite = Paysite.new
  end

  # GET /paysites/1/edit
  def edit
  end

  # POST /paysites
  # POST /paysites.json
  def create
    @paysite = Paysite.new(paysite_params)

    respond_to do |format|
      if @paysite.save
        format.html { redirect_to @paysite, notice: 'Paysite was successfully created.' }
        format.json { render :show, status: :created, location: @paysite }
      else
        format.html { render :new }
        format.json { render json: @paysite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paysites/1
  # PATCH/PUT /paysites/1.json
  def update
    respond_to do |format|
      if @paysite.update(paysite_params)
        format.html { redirect_to @paysite, notice: 'Paysite was successfully updated.' }
        format.json { render :show, status: :ok, location: @paysite }
      else
        format.html { render :edit }
        format.json { render json: @paysite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paysites/1
  # DELETE /paysites/1.json
  def destroy
    @paysite.destroy
    respond_to do |format|
      format.html { redirect_to paysites_url, notice: 'Paysite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paysite
      @paysite = Paysite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paysite_params
      params.require(:paysite).permit(:title, :sponsor_id)
    end
end
