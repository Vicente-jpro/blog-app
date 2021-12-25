class ArticlesController < ApplicationController
  
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,

  # GET /articles or /articles.json
  def index
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @categories = @article.categories.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    
    @article = Article.new(article_params)
    @article.user = current_user
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if permition_user_modify_post
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: "Article was successfully updated." }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "This article belongs to another person. It's impossible delete or update" }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy 
    if permit_user_modify_post
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "This article belongs to another person. It's impossible delete" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

    def permition_user_modify_post

      @article = set_article
      logger.info("current_user "+current_user.id.to_s+" - "+@article.user.id.to_s)
      true if current_user.id == @article.user.id 

    end

end
