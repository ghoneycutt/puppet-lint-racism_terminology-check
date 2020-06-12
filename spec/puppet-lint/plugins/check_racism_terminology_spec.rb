require 'spec_helper'

describe 'racism_terminology' do
  context 'clean' do
    let(:code) { "file { '/tmp/boring': }" }

    it 'should detect no problems' do
      is_expected.to have(0).problems
    end
  end

  context 'master' do
    let(:code) { "file { '/tmp/master': }" }
    let(:msg) { 'master/slave terminology, perhaps leader/follower?' }

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(1)
    end
  end

  context 'slave' do
    let(:code) { "file { '/tmp/slave': }" }
    let(:msg) { 'master/slave terminology, perhaps leader/follower?' }

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(1)
    end
  end

  context 'whitelist' do
    let(:code) { "file { '/tmp/whitelist': }" }
    let(:msg) { 'blacklist/whitelist terminology, perhaps blocklist/approvelist?' }

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(1)
    end
  end

  context 'blacklist' do
    let(:code) { "file { '/tmp/blacklist': }" }
    let(:msg) { 'blacklist/whitelist terminology, perhaps blocklist/approvelist?' }

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(1)
    end
  end
end
