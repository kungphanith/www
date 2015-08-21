class ArticlesController < ApplicationController
	# @article = Article.new(article_params)
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save
	 	redirect_to article_path(@article)
	end

	def article_params
		params.require(:article).permit(:title, :body)
		
	end
	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Artilce '#{@article.title}' has updated! "
		redirect_to article_path(@article)
	end


end
