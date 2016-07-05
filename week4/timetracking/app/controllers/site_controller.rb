class SiteController < ApplicationController

  def home 

    render 'home'  # a name of view template

  end

  def controller
    render "contact"

  end

  


end