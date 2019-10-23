/*
csm - Chapel Statistics Module is a statistics module for Chapel which has statistics functions.
*/
module csm {

  /* Mean function for var args */
  proc mean(args: int ...?n) {
    var sum: int;
    var counter = 0;
    for i in 1..n {
      sum+=args(i);
      counter+=1;
    }
    return sum/counter;
  }

  /* Mean function for type real(64) */
  proc mean(in args: real(64) ...?n) {
    var sum: real(64);
    var counter: real(64);
    for i in 1..n {
      sum+=args(i);
      counter+=1.0;
    }
    return sum/counter;
  }

  /* Mean function for type real(32) */
  proc mean(in args: real(32) ...?n) {
    var sum: real(32);
    var counter: real(32);
    for i in 1..n {
      sum+=args(i);
      counter+=1.0;
    }
    return sum/counter;
  }

  /* Mean function for arrays */
  proc mean(X: [?D] real) {
    var sum: real;
    var counter = 0;
    for i in X.domain {
      sum+=X(i);
      counter+=1;
    }
    return sum/counter;
  }
}

