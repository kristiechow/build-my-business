module ApplicationHelper

    def user_signed_in?
      if current_user
        true
      else
       false
      end
    end

end
