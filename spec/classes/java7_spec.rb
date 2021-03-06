require 'spec_helper'

describe 'java7', :type => :class do

  shared_examples_for 'a linux os' do
    it { is_expected.to compile }
    it { should contain_class('apt') }
    it { should contain_package('oracle-java7-installer').with(
      'responsefile' => '/tmp/java.preseed'
    ) }
    it { should contain_file('/tmp/java.preseed').with(
      'source' => 'puppet:///modules/java7/java.preseed',
      'mode' => '0600',
      'backup' => 'false'
    ) }
    it { should contain_file('/etc/profile.d/set_java_home.sh')}
  end

  context 'supported operating systems' do
    describe 'ubuntu' do
      [
        {'codename' => 'precise',
         'release' => '12.04'},
        {'codename' => 'trusty',
         'release' => '14.04'},
        {'codename' => 'xenial',
         'release' => '16.04'}
      ].each do |u|
        context "#{u['codename']}" do
          let(:facts) {{
            :lsbdistid => 'Ubuntu',
            :osfamily => 'Debian',
            :operatingsystem => 'Ubuntu',
            :lsbdistcodename => u['codename'],
            :lsbdistrelease => u['release']
          }}
          it_behaves_like 'a linux os' do
          end
          it { should contain_apt__ppa('ppa:webupd8team/java') }
        end
      end
    end
    describe 'debian' do
      ['squeeze', 'wheezy'].each do |lsbdistcodename|
        context "#{lsbdistcodename}" do
          let(:facts) {{
            :lsbdistid => 'Debian',
            :operatingsystem => 'Debian',
            :osfamily => 'Debian',
            :lsbdistcodename => lsbdistcodename,
          }}
          it_behaves_like 'a linux os' do
          end
          it { should contain_apt__source('webupd8team-java').with(
            'location' => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
            'release' => 'precise',
            'repos' => 'main',
            'key' => {
              'id' => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
              'server' => 'keyserver.ubuntu.com',
            },
            'include' => {
              'deb' => 'true',
              'src' => 'true',
            }
          ) }
        end
      end
    end
  end
end
