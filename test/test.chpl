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

UnitTest.main();
