require 'message'

describe Message do
  before do
    Timecop.freeze
  end

  after do
    Timecop.return
  end

  subject(:message) { described_class.new('Test Message', 1) }

  describe '#text' do
    it 'returns the message text' do
      expect(subject.text).to eq 'Test Message'
    end
  end

  describe '#time' do
    it 'returns the timestamp' do
      expect(subject.time).to eq Time.now
    end
  end

  describe '#id' do
    it 'returns the message id' do
      expect(subject.id).to eq 1
    end
  end
end
