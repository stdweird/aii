use strict;
use warnings;
use Test::More;
use Test::Quattor;
use AII::Shellfe;

use Readonly;
use File::Basename qw(basename);

my $logfile_name = basename(__FILE__);
$logfile_name =~ s/\.t$//;

# log dir
mkdir 'target/test';


Readonly my $AII_CONFIG_EMPTY => 'src/test/resources/aii-empty.conf';
Readonly my $AII_CONFIG_CERTS => 'src/test/resources/aii-certs.conf';
Readonly my $AII_LOG_FILE => "target/test/$logfile_name.log";
Readonly::Array my @SHELLFE_DEFAULT_OPTIONS => ('--logfile', $AII_LOG_FILE);

my $cli = AII::Shellfe->new('name',
                            @SHELLFE_DEFAULT_OPTIONS,
                            '--cfgfile', $AII_CONFIG_CERTS,
                            '--cert', '/some/other/path/to/cert');

is_deeply($cli->_download_options('lwp'), {
    cacert => 'test/ca_file',
    cadir => 'test/ca_dir',
    key => 'test/key_file',
    cert => '/some/other/path/to/cert',
}, "_download_options converted aii options in CAF::Download::LWP options");

is_deeply($cli->_download_options('ccm'), {
    ca_file => 'test/ca_file',
    ca_dir => 'test/ca_dir',
    key_file => 'test/key_file',
    cert_file => '/some/other/path/to/cert',
}, "_download_options converted aii options in CCM options");

# Test empty config
# must return empty hashref (so %$res works)
$cli = AII::Shellfe->new('name',
                         @SHELLFE_DEFAULT_OPTIONS,
                         '--cfgfile', $AII_CONFIG_EMPTY);
is_deeply($cli->_download_options('lwp'), {}, "empty config returns hashref for lwp");
is_deeply($cli->_download_options('ccm'), {}, "empty config returns hashref for ccm");

done_testing;
