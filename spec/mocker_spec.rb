require "spec_helper"

describe Fauxhai::Mocker do
  describe "#data" do
    let(:options) { {} }
    subject { described_class.new({ github_fetching: false }.merge(options)).data }

    context "with a platform and version" do
      let(:options) { { platform: "chefspec", version: "0.6.1" } }
      its(["hostname"]) { is_expected.to eq "chefspec" }
    end

    context "with a Windows platform and version" do
      let(:options) { { platform: "windows", version: "10" } }
      its(["hostname"]) { is_expected.to eq "Fauxhai" }
    end
  end

  describe "#version" do
    let(:options) { {} }
    subject { described_class.new({ github_fetching: false }.merge(options)).send(:version) }

    context "with a platform and version" do
      let(:options) { { platform: "chefspec", version: "0.6.1" } }
      it { is_expected.to eq "0.6.1" }
    end

    context "with a platform and no version" do
      let(:options) { { platform: "chefspec" } }
      it { is_expected.to eq "0.6.1" }
    end

    context "with a platform and a blank version" do
      let(:options) { { platform: "chefspec", version: "" } }
      it { is_expected.to eq "0.6.1" }
    end

    context "with a platform and a partial version" do
      let(:options) { { platform: "chefspec", version: "0.6" } }
      it { is_expected.to eq "0.6.1" }
    end

    context "with a platform and a non-matching partial version" do
      let(:options) { { platform: "chefspec", version: "0.7" } }
      it { is_expected.to eq "0.7" }
    end

    context "with a Windows platform and no version" do
      let(:options) { { platform: "windows" } }
      it { is_expected.to eq "2022" }
    end

    context "with a Windows platform and an exact partial version" do
      let(:options) { { platform: "windows", version: "2012" } }
      it { is_expected.to eq "2012" }
    end

    context "with a CentOS platform and a partial version" do
      let(:options) { { platform: "centos", version: "6" } }
      it { is_expected.to eq "6.10" }
    end

    context "with a platform and an invalid version" do
      let(:options) { { platform: "chefspec", version: "99" } }
      it { is_expected.to eq "99" }
    end

    context "with an invalid platform and an invalid version" do
      let(:options) { { platform: "notthere", version: "99" } }
      it { is_expected.to eq "99" }
    end
  end
end
