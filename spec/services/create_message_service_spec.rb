require 'rails_helper'

RSpec.describe CreateMessageService do
  before(:each) do
    @relation = Data.active_relation_sample
  end

  context 'input empty' do
    before(:each) do
      service = CreateMessageService.new(@relation[:user], {})
      @result = service.create
    end

    it 'result should have errors' do
      expect(@result).to have_key(:errors)
    end

    it 'success should be false' do
      expect(@result[:success]).to eq(false)
    end

    it 'alert content should not be empty' do
      expect(@result[:errors]).to include('Content must not be empty')
    end

    it 'alert no friends' do
      expect(@result[:errors]).to include('Please add at least one friend')
    end

    it 'should have two errors' do
      expect(@result[:errors].length).to eq(2)
    end
  end

  context 'input ids that are not friends' do
    before(:each) do
      service = CreateMessageService.new(@relation[:user], {content: 'content', friends: [100, 200]})
      @result = service.create
    end

    it 'should have one errors' do
      expect(@result[:errors].length).to eq(1)
    end

    it 'result should have errors' do
      expect(@result).to have_key(:errors)
    end

    it 'success should be false' do
      expect(@result[:success]).to eq(false)
    end

    it 'should show errors when send messages to people that are not friends' do
      expect(@result[:errors]).to include('Some people are not your friends')
    end
  end

  context 'create messages success' do
    before(:each) do
      service = CreateMessageService.new(
          @relation[:user], {content: 'content', friends: [@relation[:target].id]}
      )
      @mail = double(:mail)
      allow(@mail).to receive(:deliver_later)
      allow(MessageMailer).to receive(:new_message_mail).and_return(@mail)
      @result = service.create
    end

    it 'result should have no errors' do
      expect(@result).not_to have_key(:errors)
    end

    it 'success should be true' do
      expect(@result[:success]).to eq(true)
    end

    it 'should have key success' do
      expect(@result).to have_key(:success)
    end

    it 'should create a message' do
      expect(@relation[:user].sent_messages.count).to eq(1)
      expect(@relation[:target].received_messages.count).to eq(1)
    end

    it 'should send email' do
      expect(@mail).to receive(:deliver_later)
      CreateMessageService.new(
          @relation[:user], {content: 'content', friends: [@relation[:target].id]}
      ).create
    end
  end
end