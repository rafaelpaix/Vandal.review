class EstampasController < ApplicationController
  before_action :set_estampa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @estampas = Estampa.search(params[:search])
    else
      @estampas = Estampa.all
  end
  end
      
  def index
    @estampas = Estampa.all
  end

  def show
    @reviews = Review.where(estampa_id: @estampa.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @estampa = current_user.estampas.build
  end

  def edit
  end

  def create
    @estampa = current_user.estampas.build(estampa_params)

    respond_to do |format|
      if @estampa.save
        format.html { redirect_to @estampa, notice: 'estampa was successfully created.' }
        format.json { render :show, status: :created, location: @estampa }
      else
        format.html { render :new }
        format.json { render json: @estampa.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @estampa.update(estampa_params)
        format.html { redirect_to @estampa, notice: 'estampa was successfully updated.' }
        format.json { render :show, status: :ok, location: @estampa }
      else
        format.html { render :edit }
        format.json { render json: @estampa.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @estampa.destroy
    respond_to do |format|
      format.html { redirect_to estampas_url, notice: 'estampa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_estampa
      @estampa = Estampa.find(params[:id])
    end

    def estampa_params
      params.require(:estampa).permit(:title, :description, :criador, :rating, :image)
    end
  end
