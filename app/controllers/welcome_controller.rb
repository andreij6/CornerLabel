class WelcomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @fits    = Fitness.all
    @techs   = Tech.all
    @events  = CurrentEvent.all
  end
end
