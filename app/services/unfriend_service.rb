class UnfriendService
  def initialize(user_id, target_id)
    @user_relation = Relation.find_by(user_id: user_id, target_id: target_id)
    @target_relation = Relation.find_by(user_id: target_id, target_id: user_id)
  end

  def unfriend
    @user_relation.delete
    @target_relation.delete
  end
end