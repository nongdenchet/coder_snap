require 'rails_helper'

RSpec.describe CreateMessageService do
  before(:each) do
    relation = Data.relation_sample
    @user = relation[:user]
  end
end