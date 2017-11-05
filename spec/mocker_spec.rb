require 'spec_helper'

describe Fauxhai::Mocker do
  let(:options) { {} }
  subject { described_class.new({github_fetching: false}.merge(options)).data }

  context 'with a platform and version' do
    let(:options) { {platform: 'chefspec', version: '0.6.1'} }
    its(['hostname']) { is_expected.to eq 'chefspec' }
  end

  context 'with a platform and no version' do
    let(:options) { {platform: 'chefspec'} }
    its(['hostname']) { is_expected.to eq 'chefspec' }
  end

  context 'with a Windows platform and no version' do
    let(:options) { {platform: 'windows'} }
    its(['platform_version']) { is_expected.to eq '10.0.14393' }
  end

  context 'with a platform and an invalid version' do
    let(:options) { {platform: 'chefspec', version: '99'} }
    it { expect { subject }.to raise_error Fauxhai::Exception::InvalidPlatform }
  end

  context 'with an invalid platform and an invalid version' do
    let(:options) { {platform: 'notthere', version: '99'} }
    it { expect { subject }.to raise_error Fauxhai::Exception::InvalidPlatform }
  end
end
