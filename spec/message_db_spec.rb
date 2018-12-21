require 'messages_db'

describe Message do
  before do
    Timecop.freeze
  end

  after do
    Timecop.return
  end

  subject(:message) { described_class.create(:text => 'Test message') }

  describe '#text' do
    it 'returns the message text' do
      expect(message.text).to eq 'Test message'
    end
  end

  describe '#time' do
    it 'returns the timestamp' do
      expect(message.time).to eq Time.now.strftime("%H:%M:%S - %d/%m/%y")
    end
  end

  describe '#id' do
    it 'returns the message id' do
      allow(message).to receive(:id).and_return(2)
      expect(message.id).to eq 2
    end
  end
end
