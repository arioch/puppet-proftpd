require 'spec_helper'

describe 'proftpd::mod', :type => :define do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }

  context 'on Debian without parameters' do
    let (:facts) { debian_facts }
    let (:title) { '_VALUE_' }

    it { should create_proftpd__mod('_VALUE_') }
    it { should contain_concat__fragment('proftp_module__VALUE_').with_content(/LoadModule mod__VALUE_.c/) }
  end

  context 'on Debian with helper class and parameter: title => sql_mysql' do
    let (:facts) { debian_facts }
    let (:title) { 'sql_mysql' }

    it { should create_proftpd__mod('sql_mysql') }
    it { should include_class('proftpd::mod::sql_mysql') }
    it { should_not contain_concat__fragment('proftp_module_sql_mysql') }
  end
end

