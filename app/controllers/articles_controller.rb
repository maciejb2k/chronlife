class ArticlesController < ApplicationController
  include DashboardLayout

  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @articles = pagy(
      Article
      .includes(:account)
      .order(updated_at: :desc)
    )
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.account = current_account

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: t(".success") }
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
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), articles_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_article_path
    when :show
      add_breadcrumb @article.title, @article
    when :edit, :update
      add_breadcrumb @article.title, @article
      add_breadcrumb t(".breadcrumbs.edit"), edit_article_path(@article)
    end
  end
end
