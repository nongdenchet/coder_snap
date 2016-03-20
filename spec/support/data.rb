include FactoryGirl::Syntax::Methods

class Data
  def self.relation_sample
    user = create(:user)
    target = create(:target)
    {
        :user => user,
        :target => target,
        :user_relation => create(:user_relation, user: user, target: target),
        :target_relation => create(:target_relation, user: target, target: user)
    }
  end

  def self.active_relation_sample
    user = create(:user)
    target = create(:target)
    {
        :user => user,
        :target => target,
        :user_relation => create(:user_active_relation, user: user, target: target),
        :target_relation => create(:target_active_relation, user: target, target: user)
    }
  end
end