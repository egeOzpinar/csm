/*
csm - Chapel Statistics Module is a statistics module for Chapel which has statistics functions.

 Function            Description
==================  ==================================================
mean                Arithmetic mean (average).
geometric_mean      Geometric mean.
harmonic_mean       Harmonic mean.
median              Median (middle value).
median_low          Low median.
median_high         High median.
mode                Most common of data.
variance            Variance.
pvariance           Population variance.
stdev               Standard deviation.
pdf                 Probability density function.
==================  ==================================================

  Calculate the mean:
  mean(1,2,3,4) or mean([1,2,3,4])
  2.5

  Calculate the geometric mean:
  geometric_mean(1,2,3,10) or geometric_mean([1,2,3,10])
  2.78316

  Calculate the harmonic mean:
  harmonic_mean(5,6,7) or harmonic_mean([5,6,7])
  5.88785

  Calculate the median:
  median(1,6,2,8,3,4,4) or median([1,6,2,8,3,4,4])
  4

  Calculate the median_low:
  median_low(1,3,5,7) or median_low([1,3,5,7])
  3

  Calculate the median_high:
  median_high(1,3,5,7) or median_high([1,3,5,7])
  5

  Calculate the mode:
  mode(1,4,2,5,5,1,1,1) or mode([1,4,2,5,5,1,1,1])
  1

  Calculate the variance:
  variance(5,8,10,21) or variance([5,8,10,21])
  48.6667

  Calculate the population variance:
  pvariance(5,8,10,21) or pvariance([5,8,10,21])
  36.5

  Calculate the standard deviation:
  stdev(1,2,3,4) or stdev([1,2,3,4])
  1.29099

  Calculate the probability density function:
  pdf(3.6,3.6,0.15) or pdf(3.6,3.6,0.15)
  2.65962

*/

module csm {
  use Sort;

  pragma "no doc"

  /* Mean function for var args */
  proc mean(args...?n) {
    var sum = 0.0;
    for i in 1..n do
      sum+=args(i);
    return sum/n;
  }

  /* Mean function for arrays */
  proc mean(X: [?D]) {
    var sum = 0.0;
    for i in X.domain do
      sum+=X(i);
    return sum/X.size;
  }

  /* Geometric mean function for var args */
  proc geometric_mean(args...?n) {
    var mul = 1.0;
    for i in 1..n do
      mul*=args(i);
    return (mul**(1.0/n));
  }

  /* Geometric mean function for arrays */
  proc geometric_mean(X: [?D]) {
    var mul = 1.0;
    for i in X.domain do
      mul*=X(i);
    return mul**(1.0/X.size);
  }

  /* Harmonic mean function for var args */
  proc harmonic_mean(args...?n) {
    var sum = 0.0;
    for i in 1..n do
      sum+=1.0/args(i);
    return n/sum;
  }

  /* Harmonic mean function for arrays */
  proc harmonic_mean(X: [?D]) {
    var sum: real;
    for i in X.domain do
      sum+=1.0/X(i);
    return X.size/sum;
  }

  /* Median function for var args */
  proc median(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
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
  proc median(X: [?D]) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else{
      var i=n/2;
      return (X[i] + X[i+1])/2.0;
    }
  }

  /* Return the low median of var args */
  proc median_low(args...?n) {
    var A: [1..n] real;
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else return A[n/2];
  }

  /* Return the low median of array */
  proc median_low(X: [?D]) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else return X[n/2];
  }

  /* Return the high median of var args */
  proc median_high(args ...?n) {
    var A: [1..n] real;
    for i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    return A[n/2+1];
  }

  /* Return the high median of arrays */
  proc median_high(X: [?D]) {
    sort(X);
    var n = X.size;
    return X[n/2+1];
  }

  /* Return the mode of var args */
  proc mode(args...?n) {
    var maxValue = 0.0, maxCount = 0.0;
    for i in 1..n do {
      var count = 1;
      for j in 1..n do {
        if (args(j) == args(i)) then count+=1;
      }
      if (count > maxCount) {
        maxCount = count;
        maxValue = args(i);
      }
    }
    return maxValue;
  }

  /* Return the mode of arrays */
  proc mode(X: [?D]) {
    var maxValue = 0.0, maxCount = 0.0;
    var n = X.size;
    for i in 1..n do {
      var count = 1.0;

      for j in 1..n do {
        if (X[j] == X[i]) then count+=1;
      }

      if (count > maxCount) {
        maxCount = count;
        maxValue = X[i];
      }
    }
    return maxValue;
  }

  /* Population variance function for var args */
  proc pvariance(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr:real;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/n;
  }

   /* Population variance function for arrays */
   proc pvariance(X: [?D]) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/X.size;
  }

  /* Variance function for var args */
  proc variance(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    var m = mean(A);
    var vr : real;
    for i in A.domain {
      vr += (m-A(i))**2;
    }
    return vr/(n-1.0);
  }

  /* Variance function for arrays */
  proc variance(X: [?D]) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/(X.size-1);
  }

  /* Standard deviation function for var args */
  proc stdev(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    return sqrt(variance(A));
  }

  /* Standard deviation function for arrays */
  proc stdev(X: [?D]) {
    return sqrt(variance(X));
  }

  /* Population standard deviation function for var args */
  proc pstdev(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    return sqrt(pvariance(A));
  }

  /* Population standard deviation function for arrays */
  proc pstdev(X: [?D]) {
    return sqrt(pvariance(X));
  }

  /* Probability density function for var args */
  proc pdf(in x:real, mu:real = 0, sigma:real = 1) {
    x = (x-mu) / sigma;
    if sigma==0.0 then halt("Sigma can not be 0");
    return (exp(-x*x/2.0)):real / (sqrt(2.0*pi)):real / sigma;
  }
}



