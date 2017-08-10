class ApplicationController < ActionController::Base
    @article = Article.order(created_at: :desc).first
end
