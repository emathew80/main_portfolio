class PortfolioController < ApplicationController
  def index
    
  end

  def download

    @resume = send_file Rails.root.join('private', 'Resume.pdf'), :type=>"application/pdf", :x_sendfile=>true

  end


end
