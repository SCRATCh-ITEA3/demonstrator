#include "hellofunctions.h"
#include "unity.h"

void setUp(void)
{
   

}

void tearDown(void)
{
}


void test_functionHelloWorld1(void) {
    
    char str[128];
    getHelloWorldMessage(1, str);
    TEST_ASSERT_EQUAL_STRING("Hello SCRATCh world!\n", str);
}

void test_functionHelloWorld2(void) {
    
    char str[128];
    getHelloWorldMessage(2, str);
    TEST_ASSERT_EQUAL_STRING("Hello Hamburg\n", str);
}

void test_functionHelloWorld3(void) {
    //test stuff
    char str[128];
    getHelloWorldMessage(1, str);
    TEST_ASSERT_EQUAL_STRING("Hello Hamburg\n", str);
}





int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_functionHelloWorld1,15);
    RUN_TEST(test_functionHelloWorld2,22);
    RUN_TEST(test_functionHelloWorld3,29);
    UNITY_END();
}



