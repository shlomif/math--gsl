%module "Math::GSL::SF"
%include "typemaps.i"
%include "gsl_typemaps.i"

%apply double *OUTPUT { double * sn, double * cn, double * dn, double * sgn, const double qq };

%{
    #include "gsl/gsl_math.h"
    #include "gsl/gsl_types.h"
    #include "gsl/gsl_errno.h"
    #include "gsl/gsl_version.h"
    #include "gsl/gsl_mode.h"
    #include "gsl/gsl_sf.h"
    #include "gsl/gsl_sf_result.h"
    #include "gsl/gsl_sf_airy.h"
    #include "gsl/gsl_sf_bessel.h"
    #include "gsl/gsl_sf_clausen.h"
    #include "gsl/gsl_sf_coulomb.h"
    #include "gsl/gsl_sf_coupling.h"
    #include "gsl/gsl_sf_dawson.h"
    #include "gsl/gsl_sf_debye.h"
    #include "gsl/gsl_sf_dilog.h"
    #include "gsl/gsl_sf_elementary.h"
    #include "gsl/gsl_sf_ellint.h"
    #include "gsl/gsl_sf_elljac.h"
    #include "gsl/gsl_sf_erf.h"
    #include "gsl/gsl_sf_exp.h"
    #include "gsl/gsl_sf_expint.h"
    #include "gsl/gsl_sf_fermi_dirac.h"
    #include "gsl/gsl_sf_gamma.h"
    #include "gsl/gsl_sf_gegenbauer.h"
    #include "gsl/gsl_sf_hyperg.h"
    #include "gsl/gsl_sf_laguerre.h"
    #include "gsl/gsl_sf_lambert.h"
    #include "gsl/gsl_sf_legendre.h"
    #include "gsl/gsl_sf_log.h"
#if defined(GSL_MINOR_VERSION) &&  GSL_MINOR_VERSION >= 11
    #include "gsl/gsl_matrix.h"
    #include "gsl/gsl_vector.h"
    #include "gsl/gsl_eigen.h"
    #include "gsl/gsl_sf_mathieu.h"
#endif
    #include "gsl/gsl_sf_pow_int.h"
    #include "gsl/gsl_sf_psi.h"
    #include "gsl/gsl_sf_synchrotron.h"
    #include "gsl/gsl_sf_transport.h"
    #include "gsl/gsl_sf_trig.h"
    #include "gsl/gsl_sf_zeta.h"
%}
%include "gsl/gsl_math.h"
%include "gsl/gsl_errno.h"
%include "gsl/gsl_types.h"
%include "gsl/gsl_version.h"
%include "gsl/gsl_mode.h"
%include "gsl/gsl_sf.h"
%include "gsl/gsl_sf_result.h"
%include "gsl/gsl_sf_airy.h"
%include "gsl/gsl_sf_bessel.h"
%include "gsl/gsl_sf_clausen.h"
%include "gsl/gsl_sf_coulomb.h"
%include "gsl/gsl_sf_coupling.h"
%include "gsl/gsl_sf_dawson.h"
%include "gsl/gsl_sf_debye.h"
%include "gsl/gsl_sf_dilog.h"
%include "gsl/gsl_sf_elementary.h"
%include "gsl/gsl_sf_ellint.h"
%include "gsl/gsl_sf_elljac.h"
%include "gsl/gsl_sf_erf.h"
%include "gsl/gsl_sf_exp.h"
%include "gsl/gsl_sf_expint.h"
%include "gsl/gsl_sf_fermi_dirac.h"
%include "gsl/gsl_sf_gamma.h"
%include "gsl/gsl_sf_gegenbauer.h"
%include "gsl/gsl_sf_hyperg.h"
%include "gsl/gsl_sf_laguerre.h"
%include "gsl/gsl_sf_lambert.h"
%include "gsl/gsl_sf_legendre.h"
%include "gsl/gsl_sf_log.h"
/* XXX put guard for older GSL's */
    %include "gsl/gsl_matrix.h"
    %include "gsl/gsl_vector.h"
    %include "gsl/gsl_eigen.h"
    %include "gsl/gsl_sf_mathieu.h"

%include "gsl/gsl_sf_pow_int.h"
%include "gsl/gsl_sf_psi.h"
%include "gsl/gsl_sf_synchrotron.h"
%include "gsl/gsl_sf_transport.h"
%include "gsl/gsl_sf_trig.h"
%include "gsl/gsl_sf_zeta.h"

%include "../pod/SF.pod"
