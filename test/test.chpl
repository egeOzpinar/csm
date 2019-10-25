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

/* mean function test for arrays */
proc test_mean_array(test: borrowed Test) throws {
  var B: [1..10] real;
  B[1]=100;
  test.assertEqual(mean(B),10);
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

UnitTest.main();
