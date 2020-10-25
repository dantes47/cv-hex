class CvsController < ApplicationController
  before_action :set_cv, only: [:show, :edit, :update, :destroy]

  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show
  end

  # GET /cvs/new
  def new
    @cv = Cv.new
  end

  # GET /cvs/1/edit
  def edit
  end

  # POST /cvs
  # POST /cvs.json
  def create
    @cv = Cv.new(cv_params)
    
    if @cv.save
      redirect_to @cv, notice: 'CV was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cvs/1
  # PATCH/PUT /cvs/1.json
  def update
    respond_to do |format|
      if @cv.update(cv_params)
        format.html { redirect_to @cv, notice: 'Cv was successfully updated.' }
        format.json { render :show, status: :ok, location: @cv }
      else
        format.html { render :edit }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cvs/1
  # DELETE /cvs/1.json
  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: 'Cv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv
      @cv = Cv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cv_params
      params.require(:cv).permit(:link, :state, :user_id)
    end
end
