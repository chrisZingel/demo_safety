class HomesController < ApplicationController

  skip_before_action :authenticate_user!
  def start

  end

end
