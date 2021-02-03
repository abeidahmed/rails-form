class StaticPagesController < ApplicationController
  def home
    @users = User.all
  end
end
