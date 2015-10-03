class UsersController < ApplicationController
  def show
    render layout: 'iframe'
  end

  def iframe
    render layout: false
  end
end
