require 'spec_helper'

class Origin
  def self.to_transmit
    [1, 2, 3]
  end
end

class Dest
  def self.received
    @received ||= []
  end

  def self.receive data
    received << data
  end
end

describe Transmission::Base do
  before do
    Dest.received.clear
  end

  it "moves objects" do
    Transmission::Base.new(Origin => Dest).transmit
    expect(Dest.received).to eq [[1], [2], [3]]
  end

  context 'a chunk size is given' do
    it "moves objects in chunks" do
      Transmission::Base.new(Origin => Dest, chunk_size: 2).transmit
      expect(Dest.received).to eq [[1, 2], [3]]
    end
  end
end
