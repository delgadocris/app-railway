class ArticlesController < ApplicationController
  before_action :authenticate_author!, except: %i[ index show ]
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :set_authors, only: %i[ new edit ]
  before_action :correct_author, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all.order("created_at").paginate(page: params[:page], per_page: 2)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    #@article = Article.new
    @article = current_author.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    #@article = Article.new(article_params)
    @article = current_author.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: t('message.success_create', attribute: t('articles.article.one')) }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: t('message.success_edit', attribute: t('articles.article.one')) }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: t('message.success_destroy', attribute: t('articles.article.one')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_authors
      @authors = Author.all.pluck(:name, :id)
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :author_id)
    end

    def correct_author
      @article = current_author.articles.find_by(id: params[:id])
      redirect_to articles_path, notice: t('message.not_authorized') if @article.nil?
    end
end
