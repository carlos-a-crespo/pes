class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_news_letter, only: [:index, :new, :edit, :create, :destroy]

  def index
    @news_letters = NewsLetter.all.order(year: :desc, month: :desc)
    @articles = @news_letter.articles.order(featured: :desc, id: :asc)
  end

  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params.merge(news_letter_id: @news_letter.id))

    respond_to do |format|
      if @article.save
        format.html { redirect_to news_letter_articles_path(@news_letter), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to news_letter_articles_path @article.news_letter, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to news_letter_articles_path(@news_letter), notice: 'Article was successfully desroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_letter
      @news_letter = NewsLetter.find(params[:news_letter_id]);
    end

    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :featured)
    end
end
