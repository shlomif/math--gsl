use Test::More 'no_plan';
use Math::GSL;
use Math::GSL::Errno;
use Math::GSL::PowInt;
use Data::Dumper;
use strict;
use warnings;


{
    my $gsl = Math::GSL->new;
    my $results = { 
                'Math::GSL::PowInt::gsl_pow_2(3)'=>  3 ** 2,
                'Math::GSL::PowInt::gsl_pow_3(4)'=>  4 ** 3,
                'Math::GSL::PowInt::gsl_pow_4(5)'=>  5 ** 4,
                'Math::GSL::PowInt::gsl_pow_5(6)'=>  6 ** 5,
              };

    $gsl->verify_results($results);
}

