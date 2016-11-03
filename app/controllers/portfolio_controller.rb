class PortfolioController < ApplicationController
  def index
    
  end

  def codesnippets
    redirect_to :action => 'index', :anchor => "codesnippets"
  end

  def mywebapps
    redirect_to :action => 'index', :anchor => "mywebapps"
  end
end
