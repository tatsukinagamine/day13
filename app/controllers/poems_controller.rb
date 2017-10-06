class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :destroy]

  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.all
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
  end

  # GET /poems/new
  def new
    if  params[:back]
       @poem = Poem.new(poems_params)
    else
      @poem = Poem.new
    end
  end

  # GET /poems/1/edit
  def edit
   @poem = Poem.find(params[:id])
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = Poem.new(poem_params)

    respond_to do |format|
      if @poem.save
        format.html { redirect_to poems_path, notice: 'Poem was successfully created.' }
        format.json { render :show, status: :created, location: @poem }
      else
        format.html { render :new }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    respond_to do |format|
      if @poem = Poem.find(params[:id])
         @poem.update(poem_params.permit(:title, :content, :auther))
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.destroy
    respond_to do |format|
      format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:title, :content, :auther)
    end

end
