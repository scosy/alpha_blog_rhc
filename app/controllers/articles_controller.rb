class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	def new
		@article = Article.new
	end
	
	def edit
	end

	def index
		@articles = Article.all
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to article_path(@article)
			flash[:success] = "Article créé"
		else
			render :new, status: :see_other
		end
	end

	def update
		if @article.update(article_params)
			redirect_to article_path(@article)
			flash[:success] = "Article modifié"
		else
			render :edit, status: :see_other
		end
	end

	def destroy
		@article.destroy
		flash[:danger] = "Article Supprimé"
		redirect_to articles_path
	end

	def show
	end


	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end
end