class MakeupcasesController < ApplicationController
  # Make sure not show if user is not logged in
  before_action :make_sure_logged_in

  def index
    @makeupcases = Makeupcase.all
  end
    
  private
    def make_sure_logged_in
      if !current_user
        redirect_to new_sessions_path
      end
    end
end