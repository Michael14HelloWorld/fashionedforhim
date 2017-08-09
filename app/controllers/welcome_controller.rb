class WelcomeController < ApplicationController
  def index
    @article = Article.order(created_at: :desc).first
  end
end
