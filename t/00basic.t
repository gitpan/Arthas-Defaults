use Test::More (tests => 7);
use Test::Exception;

BEGIN {
  use_ok( 'Arthas::Defaults' );
}

use Arthas::Defaults;

diag( "Testing Arthas::Defaults $Arthas::Defaults::VERSION" );

lives_ok { say '' } 'say feature';
lives_ok { my $città = 'maniago'; } 'utf8 support in code';
dies_ok { eval "\$undeclared = 'no';"; die if $@; } 'strict variables'; 
dies_ok { eval "my \$dvar = 1; my \$dvar = 2;"; die if $@;  } 'fatal warnings';
lives_ok { carp 'ignore this warning!';  } 'carp()';
lives_ok { try { undefined_func_bj732(); } catch { say 'ud' } finally { say 'udf' } } 'try/catch/finally';

done_testing();
