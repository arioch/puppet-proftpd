require 'spec_helper'

describe 'proftpd', :type => :class do
  let (:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:params) { { :config_dir => '_CONFIG_DIR_' } }

  context 'without parameters' do
    let (:facts) { debian_facts }

    it { should create_class('proftpd') }
    it { should include_class('proftpd::install') }
    it { should include_class('proftpd::config') }
    it { should include_class('proftpd::service') }

    it { should contain_package('proftpd-basic').with_ensure('present') }
    it { should contain_file('_CONFIG_DIR_/virtuals.conf').with_ensure('present') }

    it { should contain_service('proftpd').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  context 'with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('proftpd-basic').with_ensure('_VALUE_') }
  end

  context 'with parameter: config_dir' do
    let (:facts) { debian_facts }
    let (:params) { { :config_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('directory') }
  end

  context 'with parameter: config_dir_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_dir_mode => '_VALUE_' } }

    it { should contain_file('/etc/proftpd').with_mode('_VALUE_') }
  end

  context 'with parameter: config_file_mode' do
    let (:facts) { debian_facts }
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it { should contain_file('/etc/proftpd/virtuals.conf').with_mode('_VALUE_') }
  end

  context 'with parameter: config_group' do
    let (:facts) { debian_facts }
    let (:params) { { :config_group => '_VALUE_' } }

    it { should contain_file('/etc/proftpd/virtuals.conf').with_group('_VALUE_') }
  end

  context 'with parameter: config_user' do
    let (:facts) { debian_facts }
    let (:params) { { :config_user => '_VALUE_' } }

    it { should contain_file('/etc/proftpd/virtuals.conf').with_owner('_VALUE_') }
  end

  context 'with parameter: daemon_group' do
    let (:facts) { debian_facts }
    let (:params) { { :daemon_group => '_VALUE_' } }

    it { should contain_concat__fragment('proftp_config_header').with_content(/Group.*_VALUE_$/) }
  end

  context 'with parameter: daemon_user' do
    let (:facts) { debian_facts }
    let (:params) { { :daemon_user => '_VALUE_' } }

    it { should contain_concat__fragment('proftp_config_header').with_content(/User.*_VALUE_$/) }
  end

  context 'with parameter: load_modules' do
    let (:facts) { debian_facts }
    let (:params) {
      {
        :load_modules => {
          '_VALUE_1_' => {
            'enable' => '_VALUE_1_'
          },
          '_VALUE_2_' => {
            'enable' => '_VALUE_2_'
          },
          '_VALUE_3_' => {
            'enable' => '_VALUE_3_'
          }
        }
      }
    }

    it { should create_proftpd__mod('_VALUE_1_').with_enable('_VALUE_1_') }
    it { should create_proftpd__mod('_VALUE_2_').with_enable('_VALUE_2_') }
    it { should create_proftpd__mod('_VALUE_3_').with_enable('_VALUE_3_') }
  end

  context 'with parameter: log_dir' do
    let (:facts) { debian_facts }
    let (:params) { { :log_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with_ensure('directory') }
  end

  context 'with parameter: pid_file' do
    let (:facts) { debian_facts }
    let (:params) { { :pid_file => '_VALUE_' } }

    it { should create_class('proftpd') }
  end

  context 'with parameter: pkg_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it { should contain_package('proftpd-basic').with_ensure('_VALUE_') }
  end

  context 'with parameter: pkg_list' do
    let (:facts) { debian_facts }
    let (:params) { { :pkg_list => '_VALUE_' } }

    it { should contain_package('_VALUE_') }
  end

  context 'with parameter: service_enable' do
    let (:facts) { debian_facts }
    let (:params) { { :service_enable => '_VALUE_' } }

    it { should contain_service('proftpd').with_enable('_VALUE_') }
  end

  context 'with parameter: service_ensure' do
    let (:facts) { debian_facts }
    let (:params) { { :service_ensure => '_VALUE_' } }

    it { should contain_service('proftpd').with_ensure('_VALUE_') }
  end

  context 'with parameter: service_hasstatus' do
    let (:facts) { debian_facts }
    let (:params) { { :service_hasstatus => '_VALUE_' } }

    it { should contain_service('proftpd').with_hasstatus('_VALUE_') }
  end

  context 'with parameter: service_name' do
    let (:facts) { debian_facts }
    let (:params) { { :service_name => '_VALUE_' } }

    it { should contain_service('_VALUE_') }
  end
end

