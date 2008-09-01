
%typemap(in) double const [] {
    AV *tempav;
    I32 len;
    int i;
    SV **tv;
    if (!SvROK($input))
        croak("Math::GSL : $input is not a reference!");
    if (SvTYPE(SvRV($input)) != SVt_PVAV)
        croak("Math::GSL : $input is not an array ref!");
        
    tempav = (AV*)SvRV($input);
    len = av_len(tempav);
    $1 = (double *) malloc((len+1)*sizeof(double));
    for (i = 0; i <= len; i++) {
        tv = av_fetch(tempav, i, 0);
        $1[i] = (double) SvNV(*tv);
    }
}

%apply double const [] { size_t *p };

%apply double const [] { double *data, double *dest, double *f_in, double *f_out, double data[], const double * src };
%apply double const [] { double x[], double a[], double b[] };
%apply double const [] { const double * x, const double * y, const double * w };
%apply double const [] { const double x_array[], const double xrange[], const double yrange[]};
%apply double const [] { double * base, const double * base};
%apply double const [] { const double xrange[], const double yrange[] };
%apply double const [] { const double * array };
%apply double const [] { const double data2[], const double w[] };
%apply double const [] { float const *A, float const *B, float const *C, float *C};

%apply double * OUTPUT { double *abserr, double *result };
%{
    static HV * Callbacks = (HV*)NULL;
    /* this function returns the value 
        of evaluating the function pointer
        stored in func
    */
    double callthis(double x , int func, void *params){
        SV ** sv;
        double y;
        //fprintf(stderr, "LOOKUP CALLBACK\n");
        sv = hv_fetch(Callbacks, (char*)func, sizeof(func), FALSE );
        if (sv == (SV**)NULL)
            croak("Math::GSL(callthis) : Missing callback!\n");

        dSP;
        PUSHMARK(SP);
        XPUSHs(sv_2mortal(newSVnv((double)x)));
        PUTBACK;
        call_sv(*sv, G_SCALAR);
        y = POPn;
        //fprintf(stderr,"y=%f\n", y);
        return y;
    }
%}
%typemap(in) gsl_function const * {
    gsl_function F;
    int count;
    F.params = &$input;
    F.function = &callthis;
    SV ** callback;
    double x;

    if (!SvROK($input)) {
        croak("Math::GSL : not a reference value!");
    }
    if (Callbacks == (HV*)NULL)
        Callbacks = newHV();
    //fprintf(stderr,"STORE CALLBACK\n");
    hv_store( Callbacks, (char*)&$input, sizeof($input), newSVsv($input), 0 );

    //Perl_sv_dump( $input );
    $1 = &F;
};

