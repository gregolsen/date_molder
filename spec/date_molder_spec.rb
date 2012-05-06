require 'spec_helper'

describe DateMolder do

  describe ".build_format" do

    subject { DateMolder.build_format(str) }

    context "simple date 1" do
      let(:str) { "6 May, 2012" }
      it { should == "%-d %B, %Y" }
    end

    context "simple date 2" do
      let(:str) { "May, 06, 2012" }
      it { should == "%B, %d, %Y" }
    end

    context "simple date 3" do
      let(:str) { "JAN, 06, 2012" }
      it { should == "%^b, %d, %Y" }
    end

    context "simple date 4" do
      let(:str) { "2012 JAN  06" }
      it { should == "%Y %^b  %d" }
    end

    context "simple time in 12 clock" do
      let(:str) { "12:34pm" }
      it { should == "%l:%M%P" }
    end

    context "simple time in 24 clock" do
      let(:str) { "17:34" }
      it { should == "%k:%M" }
    end

    context "simple time in 24 clock zero-padded" do
      let(:str) { "07:34" }
      it { should == "%H:%M" }
    end

    context "simple time in 12 clock zero-padded" do
      let(:str) { "07:34AM" }
      it { should == "%I:%M%p" }
    end

    context "time without minutes" do
      let(:str) { "9pm" }
      it { should == "%-l%P"}
    end

    context "time with zone" do
      let(:str) { "11:34pm +0300" }
      it { should == "%l:%M%P %z"}
    end

    context "time with zone" do
      let(:str) { "11:34pm EEST" }
      it { should == "%l:%M%P %Z"}
    end

    context "month and day" do
      let(:str) { "March, 2"}
      it { should == "%B,%e" }
    end

    context "full date and time" do
      let(:str) { "May 12, 2012, 07:34PM +0300" }
      it { should == "%B %e, %Y, %I:%M%p %z" }
    end

  end

end
