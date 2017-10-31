class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        # 重新赋值, 清空数据
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        # 要求 参数 article 在控制器中使用. 允许的字段 title, text
        @article = Article.new(article_params)
        
        if @article.save then
            # redirect 重定向. 将页面重定向到 show 动作.
            redirect_to @article
        else
            render 'new'
        end
        
        
#        params 请求的参数集合.
#        例如: http://www.example.com/?username=ruby&&email=ruby@email.com
#        其中: params[:username] 的值是 ruby
#        render plain: params[:article].inspect
    end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
