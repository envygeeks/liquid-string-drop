# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"

describe Liquid::Drop::Str do
  class TestDrop < Liquid::Drop::Str
    attr_reader :url

    def initialize(s, url:)
      @url = url
      super(s)
    end
  end

  subject do
    TestDrop.new("hello", {
      url: "world"
    })
  end

  it { respond_to :url }
  it { respond_to :is_a? }
  it { respond_to :invoke_drop }
  it { respond_to :liquid_method_missing }
  it { respond_to :to_liquid }
  it { respond_to :key? }

  context do
    subject do
      TestDrop
    end

    it { respond_to :invokable? }
    it { respond_to :invokable_methods }

    describe "#invokable?" do
      it "should include instance methods" do
        expect(subject.invokable?(:url)).to eq true
      end
    end
  end
end
