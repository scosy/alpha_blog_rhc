class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def new
		@article = Article.new
	end
	
	def edit

	end

	def index
		@articles = Article.paginate(page: params[:page], :per_page => 5)
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user
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
		flash[:success] = "Article Supprimé"
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

	def require_same_user
		if current_user != @article.user && !current_user.admin?
			flash[:danger] = "Mauvais utilisateur"
			redirect_to root_path
		end
	end
end