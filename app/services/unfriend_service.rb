class UnfriendService
  def unfriend(user_id, target_id)
    delete_relation(user_id, target_id)
    delete_relation(target_id, user_id)
  end

  private
  def delete_relation(user_id, target_id)
     Relation.find_by(user_id: user_id, target_id: target_id).destroy
  end
end