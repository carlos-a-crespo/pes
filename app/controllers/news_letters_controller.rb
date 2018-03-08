class NewsLettersController < ApplicationController
  before_action :set_news_letter, only: [:show, :edit, :update, :destroy]

  def index
    @news_letters = NewsLetter.all.order(year: :desc, month: :desc)
    @last_news_letter = @news_letters.first;
    @articles = @last_news_letter.articles
  end

  def show
  end

  def new
    @news_letter = NewsLetter.new
  end

  def edit
  end

  def create
    @news_letter = NewsLetter.new(news_letter_params)

    respond_to do |format|
      if @news_letter.save
        format.html { redirect_to @news_letter, notice: 'News letter was successfully created.' }
        format.json { render :show, status: :created, location: @news_letter }
      else
        format.html { render :new }
        format.json { render json: @news_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @news_letter.update(news_letter_params)
        format.html { redirect_to @news_letter, notice: 'News letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_letter }
      else
        format.html { render :edit }
        format.json { render json: @news_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news_letter.destroy
    respond_to do |format|
      format.html { redirect_to news_letters_url, notice: 'News letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_news_letter
      @news_letter = NewsLetter.find(params[:id])
    end

    def news_letter_params
      params.require(:news_letter).permit(:month, :year)
    end
end
