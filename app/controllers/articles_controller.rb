class ArticlesController<ApplicationController
  before_action :set_article, only: [:edit,:show,:update,:destroy]
  def new
    @article = Article.new
  end
  
  def index

    @articles = Article.all

  end  

  def create
   # render plain: params[:article].inspect
   @article = Article.new(article_params)
   # @article.save
   #redirect_to articles_show(@article)
   if @article.save
	   flash[:success] = "U have successfully created article"
	   redirect_to article_path(@article)

   else
	render 'new'

   end
  
  end

  def edit

  end

  def update

	if @article.update(article_params)
		flash[:success] = "Article Successfully Updated"
		redirect_to article_path(@article)
	else
	
		render 'edit'
	
	end

  end

  def destroy

        @article.destroy
	flash[:danger] = "Successfully Deleted article"
	redirect_to articles_path(@article)
  end

  def show

  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params

   params.require(:article).permit(:title,:descreption)   

  end
end
