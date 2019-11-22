use UnitTest;
use csm;

/* mean function test for var args */
proc test_mean_args_int(test: borrowed Test) throws {
  test.assertEqual(mean(10,2),6);
}

/* mean function test for type real(64) */
proc test_mean_args_real64(test: borrowed Test) throws {
  test.assertEqual(mean(1,1.4),1.2);
}

/* mean function test for type real(32) */
proc test_mean_args_real32(test: borrowed Test) throws {
  var num1: real(32) = 15.2;
  var num2: real(32) = 2.7;
  var equal: real(32) = 8.95;
  test.assertEqual(mean(num1,num2),equal);
}

/* mean function test for real(64) arrays */
proc test_mean_array_real64(test: borrowed Test) throws {
  var B: [1..10] real;
  B[1]=100;
  test.assertEqual(mean(B),10);
}

/* Mean function test for integer arrays */
proc test_mean_array_int(test: borrowed Test) throws {
  var B: [1..10] int;
  B[1]=100;
  test.assertEqual(mean(B),10);
}

/* mean function test for real(32) arrays */
proc test_mean_array_real32(test: borrowed Test) throws {
  var B: [1..10] real(32);
  B[1]=100.0;
  var eq: real(32) = 10.0;
  test.assertEqual(mean(B), eq);
}

/* Geometric mean function test for integer var args */
proc test_geometric_mean_int(test: borrowed Test) throws {
  test.assertLessThan(geometric_mean(1,2,3,10)-2.78316,0.00001);
  test.assertGreaterThan(geometric_mean(1,2,3,10)-2.78316,-0.00001);
}

/* Geometric mean function test for real(64) var args */
proc test_geometric_mean_real64(test: borrowed Test) throws {
  var a:real(64) = 1;
  var b:real(64) = 2;
  var c:real(64) = 3;
  var d:real(64) = 10;
  test.assertLessThan(geometric_mean(a,b,c,d)-2.78316,0.00001);
  test.assertGreaterThan(geometric_mean(a,b,c,d)-2.78316,-0.00001);
}

/* Geometric mean function test for real(32) var args */
proc test_geometric_mean_real32(test: borrowed Test) throws {
  var a:real(32) = 1;
  var b:real(32) = 2;
  var c:real(32) = 3;
  var d:real(32) = 10;
  test.assertLessThan(geometric_mean(a,b,c,d)-2.78316,0.00001);
  test.assertGreaterThan(geometric_mean(a,b,c,d)-2.78316,-0.00001);
}

/* Geometric mean function test for arrays */
proc test_geometric_mean_array(test: borrowed Test) throws {
  var a:[1..4] real(64);
  a(1)=1.0;
  a(2)=2;
  a(3)=3;
  a(4)=10;
  test.assertLessThan(geometric_mean(a)-2.78316,0.00001);
  test.assertGreaterThan(geometric_mean(a)-2.78316,-0.00001);
}

/* Harmonic mean function test for integer var args */
proc test_harmonic_mean_int(test: borrowed Test) throws {
  test.assertLessThan(harmonic_mean(5,6,7)-5.88785,0.00001);
  test.assertGreaterThan(harmonic_mean(5,6,7)-5.88785,-0.00001);
}

/* Harmonic mean function test for real(64) var args */
proc test_harmonic_mean_real64(test: borrowed Test) throws {
  test.assertLessThan(harmonic_mean(5.0,6.0,7.0)-5.88785,0.00001);
  test.assertGreaterThan(harmonic_mean(5.0,6.0,7.0)-5.88785,-0.00001);
}

/* Harmonic mean function test for real(32) var args */
proc test_harmonic_mean_real32(test: borrowed Test) throws {
  var a: real(32) = 5;
  var b: real(32) = 6;
  var c: real(32) = 7;
  test.assertLessThan(harmonic_mean(a,b,c)-5.88785,0.00001);
  test.assertGreaterThan(harmonic_mean(a,b,c)-5.88785,-0.00001);
}

/* Harmonic mean function test for arrays */
proc test_harmonic_mean_array(test: borrowed Test) throws {
  var a: [1..3] real;
  a(1)=5.0;
  a(2)=6.0;
  a(3)=7.0;
  test.assertLessThan(harmonic_mean(a)-5.88785,0.00001);
  test.assertGreaterThan(harmonic_mean(a)-5.88785,-0.00001);
}

/* Median function test for integer var args */
proc test_median_int(test: borrowed Test) throws {
  test.assertEqual(median(1,6,2,8,3,4,4), 4);
  test.assertEqual(median(1,6,2,8,3,4), 3.5);
}

/* Median function test for real(64) var args */
proc test_median_real64(test: borrowed Test) throws {
  test.assertEqual(median(1.3,2.1,5.6,5.3,4.8), 4.8);
  test.assertEqual(median(1.3,2.1,5.6,5.3,4.8,10.7), 5.05);
}

/* Median function test for real(32) var args */
proc test_median_real32(test: borrowed Test) throws {
  var x:real(32) = 1.3;
  var y:real(32) = 2.1;
  var z:real(32) = 5.6;
  var t:real(32) = 5.3;
  var r:real(32) = 4.8;
  var p:real(32) = 10.7;
  var eq:real(32) = 4.8;
  var eq1:real(32) = 5.05;
  test.assertEqual(median(x,y,z,t,r), eq);
  test.assertEqual(median(x,y,z,t,r,p), eq1);
}

/* Median function test for arrays */
proc test_median_array(test: borrowed Test) throws {
  var arr = [1.3,2.1,5.6,5.3,4.8];
  var arr1 = [1.3,2.1,5.6,5.3,4.8,10.7];
  test.assertEqual(median(arr), 4.8);
  test.assertEqual(median(arr1), 5.05);
}

/* Low median function test for integer var args */
proc test_median_low_int(test: borrowed Test) throws {
  test.assertEqual(median_low(1,3,5,7), 3);
}

/* Low median function test for real(64) var args */
proc test_median_low_real64(test: borrowed Test) throws {
  test.assertEqual(median_low(1.0,3.0,5.0,7.0), 3.0);
}

/* Low median function test for real(32) var args */
proc test_median_low_real32(test: borrowed Test) throws {
  var a: real(32) = 1.0;
  var b: real(32) = 3.0;
  var c: real(32) = 5.0;
  var d: real(32) = 7.0;
  var eq:real(32) = 3.0;
  test.assertEqual(median_low(a,b,c,d), eq);
}

/* Low median function test for real(64) arrays */
proc test_median_low_array(test: borrowed Test) throws {
  var arr = [1.0,3.0,5.0,7.0];
  test.assertEqual(median_low(arr), 3.0);
}

/* Low median function test for integer var args */
proc test_median_high_int(test: borrowed Test) throws {
  test.assertEqual(median_high(1,3,5,7), 5);
}

/* Low median function test for real(64) var args */
proc test_median_high_real64(test: borrowed Test) throws {
  test.assertEqual(median_high(1.0,3.0,5.0,7.0), 5.0);
}

/* Low median function test for real(32) var args */
proc test_median_high_real32(test: borrowed Test) throws {
  var a: real(32) = 1.0;
  var b: real(32) = 3.0;
  var c: real(32) = 5.0;
  var d: real(32) = 7.0;
  var eq: real(32) = 5.0;
  test.assertEqual(median_high(1.0,3.0,5.0,7.0), 5.0);
}

/* Low median function test for real(64) arrays */
proc test_median_high_array(test: borrowed Test) throws {
  var arr = [1.0,3.0,5.0,7.0];
  test.assertEqual(median_high(arr), 5.0);
}

/* Mode function test for ineteger var args */
proc tes_mode_int(test: borrowed Test) throws {
  test.assertEqual(mode(1,2,3,4,2,2,1,1,1,1), 1);
}

/* Mode function test for real(64) var args */
proc tes_mode_real64(test: borrowed Test) throws {
  test.assertEqual(mode(1.0,2.0,3.1,4.2,2.2,2.2,1.5,1.2,1.9,1.3), 2.2);
}

/* Mode function test for real(32) var args */
proc tes_mode_real32(test: borrowed Test) throws {
  var a:real(32) = 4.2;
  var b:real(32) = 9.7;
  test.assertEqual(mode(a,b,a,a,a,a,b,b,b,a), a);
}

/* Population variance function test for integer var args */
proc test_pvariance_int(test: borrowed Test) throws {
  test.assertEqual(pvariance(5,8,10,21),36.5);
}

/* Population variance function test for real(64) var args */
proc test_pvariance_real64(test: borrowed Test) throws {
  test.assertEqual(pvariance(5.0,8.0,10.0,21.0),36.5);
}

/* Population variance function test for real(32) var args */
proc test_pvariance_real32(test: borrowed Test) throws {
  var a: real(32) = 5.0;
  var b: real(32) = 8.0;
  var c: real(32) = 10.0;
  var d: real(32) = 21.0;
  var eq: real(32) = 36.5;
  test.assertEqual(pvariance(a,b,c,d), eq);
}

/* Population variance function test for arrays */
proc test_pvariance_array(test: borrowed Test) throws {
  var arr = [5.0,8.0,10.0,21.0];
  test.assertEqual(pvariance(arr), 36.5);
}

/* Population variance function test for integer arrays */
proc test_pvariance_int_array(test: borrowed Test) throws {
  var arr = [5,8,10,21];
  test.assertEqual(pvariance(arr), 36.5);
}

/* Variance function test for integer var args */
proc test_variance_int(test: borrowed Test) throws {
  test.assertLessThan(variance(5,8,10,21)-48.6667, 0.00001);
}

/* Variance function test for real(64) var args */
proc test_variance_real64(test: borrowed Test) throws {
  test.assertLessThan(variance(5.0,8.0,10.0,21.0)-48.6667, 0.00001);
}

/* Variance function test for real(32) var args */
proc test_variance_real32(test: borrowed Test) throws {
  var a: real(32) = 5.0;
  var b: real(32) = 8.0;
  var c: real(32) = 10.0;
  var d: real(32) = 21.0;
  test.assertLessThan(variance(a,b,c,d)-48.6667, 0.00001);
}

/* Variance function test for real arrays */
proc test_variance_array(test: borrowed Test) throws {
  var arr = [5.0,8.0,10.0,21.0];
  test.assertLessThan(variance(arr)-48.6667, 0.00001);
}

/* Variance function test for integer arrays */
proc test_variance_integer_array(test: borrowed Test) throws {
  var arr = [5,8,10,21];
  test.assertLessThan(variance(arr)-48.6667, 0.00001);
}

/* Standard deviation function test for integer var args */
proc test_stdev_int(test: borrowed Test) throws {
  test.assertLessThan(stdev(1,2,3,4)-1.29099, 0.00001);
}

/* Standard deviation function test for real(64) var args */
proc test_stdev_real64(test: borrowed Test) throws {
  test.assertLessThan(stdev(1.0,2.0,3.0,4.0)-1.29099, 0.00001);
}

/* Standard deviation function test for real(32) var args */
proc test_stdev_real32(test: borrowed Test) throws {
  var a: real(32) = 1.0;
  var b: real(32) = 2.0;
  var c: real(32) = 3.0;
  var d: real(32) = 4.0;
  test.assertLessThan(stdev(a,b,c,d)-1.29099, 0.00001);
}

/* Standard deviation function test for arrays */
proc test_stdev_array(test: borrowed Test) throws {
  var arr = [1.0,2.0,3.0,4.0];
  test.assertLessThan(stdev(arr)-1.29099, 0.00001);
}

/* Probability density function test for real(64) var args */
proc test_pdf_real64(test: borrowed Test) throws {
  var x: real(64) = 3.6;
  var mu: real(64) = 3.6;
  var sigma:real(64) = 0.15;
  test.assertLessThan(pdf(x, mu, sigma)-2.65962, 0.00001);
}

/* Probability density function test for real(32) var args */
proc test_pdf_real32(test: borrowed Test) throws {
  var x: real(32) = 3.6;
  var mu: real(32) = 3.6;
  var sigma: real(32) = 0.15;
  var eq: real(32) = 0.00001;
  test.assertLessThan(pdf(x, mu, sigma)-2.65962, eq);
}
/* Population standard deviation function test for integer var args */
proc test_pstdev_int(test: borrowed Test) throws {
  test.assertLessThan(pstdev(1,2,2,2,3,4)-0.942809, 0.00001);
}

/* Population standard deviation function test for real(64) var args */
proc test_pstdev_real64(test: borrowed Test) throws {
  test.assertLessThan(pstdev(1.0,2.0,2.0,2.0,3.0,4.0)-0.942809, 0.00001);
}

/* Population standard deviation function test for real(32) var args */
proc test_pstdev_real32(test: borrowed Test) throws {
  var a: real(32) = 1.0;
  var b: real(32) = 2.0;
  var c: real(32) = 3.0;
  var d: real(32) = 4.0;
  test.assertLessThan(pstdev(a,b,b,b,c,d)-0.942809, 0.00001);
}

/* Population standard deviation function test for arrays */
proc test_pstdev_array(test: borrowed Test) throws {
  var arr = [1.0,2.0,2.0,2.0,3.0,4.0];
  test.assertLessThan(pstdev(arr)-0.942809, 0.00001);
}
UnitTest.main();
