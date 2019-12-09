/*
Chapel Statistics Module is a statistics module for Chapel which has statistics functions.
It provides fundamental statistics functions. Forms of the functions except :proc:`~csm.pdf()` function:

.. code-block:: chapel

  proc funcName(var args) {}

or

.. code-block:: chapel

  proc funcName(array) {}

Examples
--------

Basic Usage
^^^^^^^^^^^

For variadic arguments:

.. code-block:: chapel

  // example1.chpl
  use csm;

  var x = mean(12,32,43,2,5,743,54);

For arrays:

.. code-block:: chapel

  // example2.chpl
  use csm;

  var array = [12,32,43,2,5,743,54];
  var m = mean(array);

Compile the code samples at the above:

.. code-block:: chapel

  chpl example1.chpl

and

.. code-block:: chapel

  chpl example2.chpl

return same result.

Output:

.. code-block:: text

  127.286
*/
module csm {
  use Sort;

  /*
    Calculate the mean.

    :arg args: A set of number to calculate the mean.
    :type args: `int` , `real`
  */
  proc mean(args...?n) {
    return (+ reduce args)/n:real;
  }

  /*
    Calculate the mean.

    :arg X: An array of number to calculate the mean.
    :type args: `array`
  */
  proc mean(X: [?D]) {
    var sum = (+ reduce X);
    return sum/X.size;
  }

  /*
    Calculate the geometric mean.

    :arg args: A set of number to calculate the geometric mean.
    :type args: `int` , `real`
  */
  proc geometric_mean(args...?n) {
    var mul = (* reduce args);
    return (mul**(1.0/n));
  }

  /*
    Calculate the geometric mean.

    :arg X: An array of number to calculate the geometric mean.
    :type args: `array`
  */
  proc geometric_mean(X: [?D]) {
    var mul = (* reduce X);
    return mul**(1.0/X.size);
  }

  /*
    Calculate the harmonic mean.

    :arg args: A set of number to calculate the harmonic mean.
    :type args: `int` , `real`
  */
  proc harmonic_mean(args...?n) {
    var sum = 0.0;
    for i in 1..n do
      sum+=1.0/args(i);
    return n:real/sum;
  }

  /*
    Calculate the harmonic mean.

    :arg X: An array of number to calculate the harmonic mean.
    :type args: `array`
  */
  proc harmonic_mean(X: [?D]) {
    var sum: real;
    for i in X.domain do
      sum+=1.0/X(i);
    return X.size/sum;
  }

  /*
    Calculate the median.

    :arg args: A set of number to calculate the median.
    :type args: `int` , `real`
  */
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

  /*
    Calculate the median.

    :arg X: An array of number to calculate the median.
    :type args: `array`
  */
  proc median(X: [?D]) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else{
      var i=n/2;
      return (X[i] + X[i+1])/2.0;
    }
  }

  /*
    Calculate the low median.

    :arg args: A set of number to calculate the low median.
    :type args: `int` , `real`
  */
  proc median_low(args...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    if(n%2==1) then return A[n/2+1];
    else return A[n/2];
  }

  /*
    Calculate the low median.

    :arg X: An array of number to calculate the low median.
    :type args: `array`
  */
  proc median_low(X: [?D]) {
    sort(X);
    var n = X.size;
    if(n%2==1) then return X[n/2+1];
    else return X[n/2];
  }

  /*
    Calculate the high median.

    :arg args: A set of number to calculate the high median.
    :type args: `int` , `real`
  */
  proc median_high(args ...?n) {
    var A: [1..n] real;
    forall i in 1..n {
      A[i] = args(i);
    }
    sort(A);
    return A[n/2+1];
  }

  /*
    Calculate the high median.

    :arg X: An array of number to calculate the high median.
    :type args: `array`
  */
  proc median_high(X: [?D]) {
    sort(X);
    var n = X.size;
    return X[n/2+1];
  }

  /*
    Calculate the mode.

    :arg args: A set of number to calculate the mode.
    :type args: `int` , `real`
  */
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


  /*
    Calculate the mode.

    :arg X: An array of number to calculate the mode.
    :type args: `array`
  */
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

  /*
    Calculate the population variance.

    :arg args: A set of number to calculate the population variance.
    :type args: `int` , `real`
  */
  proc pvariance(args...?n) {
    var m = mean((...args));
    var vr:real;
    for i in 1..n {
      vr += (m-args(i))**2;
    }
    return vr/n;
  }

  /*
    Calculate the population variance.

    :arg X: An array of number to calculate the population variance.
    :type args: `array`
  */
   proc pvariance(X: [?D]) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/X.size;
  }

  /*
    Calculate the variance.

    :arg args: A set of number to calculate the variance.
    :type args: `int` , `real`
  */
  proc variance(args...?n) {
    var m = mean((...args));
    var vr : real;
    for i in 1..n {
      vr += (m-args(i))**2;
    }
    return vr/(n-1.0);
  }

  /*
    Calculate the variance.

    :arg X: An array of number to calculate the variance.
    :type args: `array`
  */
  proc variance(X: [?D]) {
    var m = mean(X);
    var vr = 0.0;
    for i in X.domain {
      vr += (m-X(i))**2;
    }
    return vr/(X.size-1);
  }

  /*
    Calculate the standard deviation.

    :arg args: A set of number to calculate the standard deviation.
    :type args: `int` , `real`
  */
  proc stdev(args...?n) {
    return sqrt(variance((...args)));
  }

  /*
    Calculate the standard deviation.

    :arg X: An array of number to calculate the standard deviation.
    :type args: `array`
  */
  proc stdev(X: [?D]) {
    return sqrt(variance(X));
  }

  /*
    Calculate the population standard deviation.

    :arg args: A set of number to calculate the population standard deviation.
    :type args: `int` , `real`
  */
  proc pstdev(args...?n) {
    return sqrt(pvariance((...args)));
  }

  /*
    Calculate the population standard deviation.

    :arg X: An array of number to calculate the population standard deviation.
    :type args: `array`
  */
  proc pstdev(X: [?D]) {
    return sqrt(pvariance(X));
  }

  /*
    Calculate the probability density function of a Gaussian Distribution.

    :arg x: Value to be calculated.
    :type x: `real`

    :arg mu: Mean.
    :type mu: `real`

    :arg sigma: Standard deviation
    :type sigma: `real`
  */
  proc pdf(in x:real, mu:real = 0, sigma:real = 1) {
    if sigma==0.0 then halt("Sigma can not be 0");
    x = (x-mu) / sigma;
    return (exp(-x*x/2.0)):real / (sqrt(2.0*pi)):real / sigma;
  }
}


