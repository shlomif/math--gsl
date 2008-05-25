package Math::GSL::Matrix::Test;
use base q{Test::Class};
use Test::More;
use Math::GSL::Matrix qw/:all/;
use Math::GSL::Vector qw/gsl_vector_get/;
use Math::GSL qw/is_similar/;
use Data::Dumper;
use strict;

sub make_fixture : Test(setup) {
    my $self = shift;
    $self->{matrix} = gsl_matrix_alloc(5,5);

}

sub teardown : Test(teardown) {
}

sub GSL_MATRIX_ALLOC : Tests {
    my $matrix = gsl_matrix_alloc(5,5);
    isa_ok($matrix, 'Math::GSL::Matrix');
}

sub GSL_MATRIX_SET : Tests {
    my $self = shift;
    map { gsl_matrix_set($self->{matrix}, $_,$_, $_ ** 2) } (0..4);
    isa_ok( $self->{matrix}, 'Math::GSL::Matrix' );

    my @got = map { gsl_matrix_get($self->{matrix}, $_, $_) } (0..4);

    map { ok(is_similar($got[$_], $_ ** 2)) } (0..4);

}

sub GSL_MATRIX_CALLOC : Tests {
   my $matrix = gsl_matrix_calloc(5,5);
   isa_ok($matrix, 'Math::GSL::Matrix');

   my @got = map { gsl_matrix_get($matrix, $_, $_) } (0..4);
   map { is($got[$_], 0) } (0..4);
}

sub GSL_MATRIX_FREE : Tests {
   my $matrix = gsl_matrix_calloc(5,5);
   isa_ok($matrix, 'Math::GSL::Matrix');

   is(gsl_matrix_get($matrix, 0, 0), 0);
   gsl_matrix_free($matrix);
   
}

sub GSL_MATRIX_SUBMATRIX : Tests {
   my $matrix = gsl_matrix_alloc(5,5);
   map { gsl_matrix_set($matrix, $_,$_, $_) } (0..4);
   my $subMatrix = gsl_matrix_submatrix($matrix, 0, 0, 2, 2);
   my @got = map { gsl_matrix_get($matrix, $_, $_) } (0..2);
   map { is($got[$_], $_) } (0..2);

}

sub GSL_MATRIX_ROW : Tests {
   my $matrix = gsl_matrix_alloc(4,4);
   map { gsl_matrix_set($matrix, $_,$_, $_) } (0..3);
   my $vector = gsl_matrix_row($matrix, 2);
  # my @got = map { gsl_vector_get($vector, $_) } (0..3);
  # map { is($got[$_], $_) } (0..3);
}

sub GSL_MATRIX_COLUMN : Tests {
   my $matrix = gsl_matrix_alloc(4,4);
   map { gsl_matrix_set($matrix, $_,$_, $_) } (0..3);
   my $view = gsl_matrix_column($matrix, 2);
   print Dumper [ $view ];
   #my @views = map { gsl_vector_get($vector, $_) } (0..3);
   #print Dumper [ @views ];
   #map { is($got[$_], 1) } (0..3);
}

sub GSL_MATRIX_DIAGONAL : Tests {
   my $matrix = gsl_matrix_alloc(4,4);
   map { gsl_matrix_set($matrix, $_,$_, $_) } (0..3);
   my $vector = gsl_matrix_diagonal($matrix);
   #my @got = map { gsl_vector_get($vector, $_) } (0..3);
   #map { is($got[$_], $_) } (0..3);
}

sub GSL_MATRIX_SUBDIAGONAL : Tests {
   my $matrix = gsl_matrix_alloc(4,4);
   map { gsl_matrix_set($matrix, $_,$_, $_) } (0..3);
   my $vector = gsl_matrix_subdiagonal($matrix, 0);
   #my @got = map { gsl_vector_get($vector, $_) } (0..3);
   #map { is($got[$_], $_) } (0..3);

   $vector = gsl_matrix_subdiagonal($matrix, 1);
   #@got = map { gsl_vector_get($vector, $_) } (0..2);
   #map { is($got[$_], $_) } (1..3);
}
1;
