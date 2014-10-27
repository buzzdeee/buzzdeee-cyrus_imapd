require 'spec_helper'
describe 'cyrus_imapd' do

  context 'with defaults for all parameters' do
    it { should contain_class('cyrus_imapd') }
  end
end
