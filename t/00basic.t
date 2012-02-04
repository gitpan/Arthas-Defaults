use Test::More (tests => 5);
use Test::Exception;

BEGIN {
  use_ok( 'Arthas::Defaults' );
}

use Arthas::Defaults;

diag( "Testing Arthas::Defaults $Arthas::Defaults::VERSION" );

lives_ok { say '' } 'say feature';
lives_ok { my $città = 'maniago'; } 'utf8 support in code';
lives_ok { carp 'ignore this warning!';  } 'carp()';
lives_ok { try { undefined_func_bj732(); } catch { say 'ud' } finally { say 'udf' } } 'try/catch/finally';

done_testing();
