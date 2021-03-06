class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    
      if params[:search]
        @recipes  = Recipe.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])
        if @recipes.length == 0
          flash[:notice] = "Sorry we couldnt find what you were looking for"
          @recipes = Recipe.find_with_reputation(:likes, :all, order: "likes desc" )
        end
      else
        @recipes = Recipe.find_with_reputation(:likes, :all, order: "likes desc" )
      end
    
      

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
   
  end
  
  def latest
    @recipes = Recipe.find(:all, :order => 'created_at')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
    
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        pdf = RecipePdf.new(@recipe)
        send_data pdf.render, filename: "recipe #{@recipe.title}.pdf",
                              type: "application/pdf",
                            disposition: "inline"
                              
      end
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
  
  def like
    value = params[:type] == "up" ? 1: -1
    @recipe = Recipe.find(params[:id])
    @recipe.add_or_update_evaluation(:likes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end
end
