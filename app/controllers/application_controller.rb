class ApplicationController < ActionController::Base
    def index
        @article = Article.order(created_at: :desc).first
    end
end
