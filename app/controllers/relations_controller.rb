# == Schema Information
#
# Table name: relations
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          default(FALSE)
#

class RelationsController < ApplicationController
  before_action :require_login

  def create
    @relation = current_user.relations.create(name: 'friend', target_id: params[:id])
    respond_to :js
  end

  def index
    @relations = Relation.friend_requests(current_user_id)
  end

  def confirm
    @relation = ConfirmRelationService.new(current_user, params[:id]).confirm_relation
    respond_to :js
  end
end
