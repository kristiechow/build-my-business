class MatchesController < ApplicationController

  def create
    from_user = current_user
    to_user = User.find(params[:id])
    matchable = Match.create(user: from_user, matched_user: to_user, accepted: false, status: "Pending")
    to_user.received_matches << matchable
    redirect_to redirect_path(to_user)
  end


  def request_accept
    matchable = Match.where(id: params[:id]).first
    matchable.update_attributes(accepted: "true", status: "Matched!")
    redirect_to accept_match_path(current_user)
  end

  def request_reject
    matchable = Match.where(id: params[:id]).first
    matchable.destroy
  end

end
