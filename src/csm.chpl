/*
csm - Chapel Statistics Module is a statistics module for Chapel which has statistics functions.
*/
module csm {

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

  /* Mean function for arrays */
  proc mean(X: [?D] real) {
    var sum: real;
    for i in X.domain do
      sum+=X(i);
    return sum:real/X.size;
  }
}
