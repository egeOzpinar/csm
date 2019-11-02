/*
csm - Chapel Statistics Module is a statistics module for Chapel which has statistics functions.
*/

module csm {
  use Sort;

  /* Mean function for var args */
  proc mean(args: int ...?n) {
    var sum: int;
    for i in 1..n do
      sum+=args(i);
    return sum:real(64)/n;
  }

  /* Mean function for type real(64) */
  proc mean(in args: real(64) ...?n) {
    var sum: real(64);
    for i in 1..n do
      sum+=args(i);
    return sum:real(64)/n;
  }

  /* Mean function for type real(32) */
  proc mean(in args: real(32) ...?n) {
    var sum: real(32);
    for i in 1..n do
      sum+=args(i);
    return sum:real(32)/n;
  }

  /* Mean function for real(64) arrays */
  proc mean(X: [?D] real) {
    var sum: real;
    for i in X.domain do
      sum+=X(i);
    return sum:real/X.size;
  }

  /* Mean function for integer arrays */
  proc mean(X: [?D] int) {
    var sum: int;
    for i in X.domain do
      sum+=X(i);
    return sum:real/X.size;
  }

  /* Mean function for real(32) arrays */
  proc mean(X: [?D] real(32)) {
    var sum: real(32);
    for i in X.domain do
      sum+=X(i);
    return sum:real/X.size;
  }

  /* Geometric mean function for integer var args */
  proc geometric_mean(args: int ...?n): real(64) {
    var mul = 1;
    for i in 1..n do
      mul*=args(i);
    return (mul**(1.0/n)):real(64);
  }

  /* Geometric mean function for real(64) var args */
  proc geometric_mean(args: real(64) ...?n) {
    var mul = 1.0;
    for i in 1..n do
      mul*=args(i);
    return mul**(1.0/n);
  }

  /* Geometric mean function for real(32) var args */
  proc geometric_mean(args: real(32) ...?n) {
    var mul = 1.0;
    for i in 1..n do
      mul*=args(i);
    return mul**(1.0/n);
  }

  /* Geometric mean function for arrays */
  proc geometric_mean(X: [?D] real) {
    var mul = 1.0;
    for i in X.domain do
      mul*=X(i);
    return mul**(1.0/X.size);
  }

  /* Harmonic mean function for integer var args */
  proc harmonic_mean(args: int ...?n) {
    var sum: real;
    for i in 1..n do
      sum+=1.0/args(i);
    return n/sum;
  }

  /* Harmonic mean function for real(64) var args */
  proc harmonic_mean(args: real(64) ...?n) {
    var sum: real;
    for i in 1..n do
      sum+=1.0/args(i);
    return n/sum;
  }

  /* Harmonic mean function for real(32) var args */
  proc harmonic_mean(args: real(32) ...?n) {
    var sum: real(32);
    for i in 1..n do
      sum+=1.0/args(i);
    return n/sum;
  }

  /* Harmonic mean function for arrays */
  proc harmonic_mean(X: [?D] real) {
    var sum: real;
    for i in X.domain do
      sum+=1.0/X(i);
    return X.size/sum;
  }

  /* Median function for integer var args */
  proc median(args: int ...?n) {
    var A: [1..n] int;
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else{
      var i=n/2;
      return (A[i] + A[i+1])/2.0;
    }
  }

  /* Median function for real(64) var args */
  proc median(args: real(64) ...?n) {
    var A: [1..n] real(64);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else{
      var i=n/2;
      return (A[i] + A[i+1])/2.0;
    }
  }

  /* Median function for real(32) var args */
  proc median(args: real(32) ...?n) {
    var A: [1..n] real(32);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else{
      var i=n/2;
      return (A[i] + A[i+1])/2.0;
    }
  }

  /* Median function for arrays */
  proc median(X: [?D] real) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else{
      var i=n/2;
      return (X[i] + X[i+1])/2.0;
    }
  }

  /* Return the low median of int args */
  proc median_low(args: int ...?n) {
    var A: [1..n] int;
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else return A[n/2];
  }

  /* Return the low median of real(64) args */
  proc median_low(args: real(64) ...?n) {
    var A: [1..n] real(64);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else return A[n/2];
  }

  /* Return the low median of real(32) args */
  proc median_low(args: real(32) ...?n) {
    var A: [1..n] real(32);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else return A[n/2];
  }

  /* Return the low median of real(64) array */
  proc median_low(X: [?D] real) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else return X[n/2];
  }
  
  /* Return the high median of integer var args */
  proc median_high(args: int ...?n) {
    var A: [1..n] int;
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    return A[n/2+1];
  }

  /* Return the high median of real(64) var args */
  proc median_high(args: real(64) ...?n) {
    var A: [1..n] real(64);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    return A[n/2+1];
  }

  /* Return the high median of real(32) var args */
  proc median_high(args: real(32) ...?n) {
    var A: [1..n] real(32);
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    return A[n/2+1];
  }

  /* Return the high median of arrays */
  proc median_high(X: [?D] real) {
    sort(X);
    var n = X.size;
    return X[n/2+1];
  }
/* Population variance function for integer var args */
  proc pvariance(args: int ...?n) {
    var A: [1..n] int;
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr = 0.0;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/n;
  }

  /* Population variance function for real(64) var args */
  proc pvariance(args: real(64) ...?n) {
    var A: [1..n] real(64);
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr = 0.0;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/n;
  }

  /* Population variance function for real(32) var args */
  proc pvariance(args: real(32) ...?n) {
    var A: [1..n] real(32);
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr:real(32);
    for i in A.domain {
      vr += (m-A(i)):real(32)**2;
    }
    return vr/n;
  }

   /* Population variance function for arrays */
   proc pvariance(X: [?D] real) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/X.size;
  }

  /* Variance function for integer var args */
  proc variance(args: int ...?n) {
    var A: [1..n] int;
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr = 0.0;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/(n-1.0);
  }

  /* Variance function for real(64) var args */
  proc variance(args: real(64) ...?n) {
    var A: [1..n] real(64);
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr = 0.0;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/(n-1.0);
  }

  /* Variance function for real(32) var args */
  proc variance(args: real(32) ...?n) {
    var A: [1..n] real(32);
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr:real(32);
    for i in A.domain {
      vr += (m-A(i)):real(32)**2;
    }
    return vr/(n-1.0);
  }

  /* Variance function for real arrays */
  proc variance(X: [?D] real) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/(X.size-1);
  }

  /* Variance function for integer arrays */
  proc variance(X: [?D] int) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/(X.size-1);
  }

  /* Standard deviation function for integer var args */
  proc stdev(args: int ...?n) {
    var A: [1..n] int;
    forall i in 1..n {
      A[i] = args(i);
    }
    return sqrt(variance(A));
  }

  /* Standard deviation function for real(64) var args */
  proc stdev(args: real(64) ...?n) {
    var A: [1..n] real(64);
    forall i in 1..n {
      A[i] = args(i);
    }
    return sqrt(variance(A));
  }

  /* Standard deviation function for real(32) var args */
  proc stdev(args: real(32) ...?n) {
    var A: [1..n] real(32);
    forall i in 1..n {
      A[i] = args(i);
    }
    return sqrt(variance(A));
  }

  /* Standard deviation function for arrays */
  proc stdev(X: [?D] real) {
    return sqrt(variance(X));
  }
}



