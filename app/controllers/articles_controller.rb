class ArticlesController < ApplicationController
  layout "dashboard"

  before_action :set_article, only: %i[show edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    @pagy, @articles = pagy(Article.order(updated_at: :desc))
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.account = current_account

    respond_to do |format|
      if @article.save
        format.html do
          redirect_to article_url(@article), notice: "Artykuł został pomyślnie utworzony i opublikowany."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html do
          redirect_to article_url(@article), notice: "Artykuł został pomyślnie zaktualizowany."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Artykuł został pomyślnie usunięty." }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("strefa wiedzy", articles_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("nowy artykuł", new_article_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(@article.title, @article)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj artykuł", edit_article_path(@article))
  end
end
