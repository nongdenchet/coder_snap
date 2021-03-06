class ConfirmRelationService
  def initialize(current_user, relation_id)
    @current_user = current_user
    @relation_id = relation_id
  end

  def confirm_relation
    relation = Relation.find(@relation_id)
    relation.update_attributes(active: true)
    create_user_relation(relation.user_id)
    relation
  end

  private
  def create_user_relation(target_id)
    @current_user.relations.create(
        name: 'friend',
        target_id: target_id,
        active: true
    )
  end
end