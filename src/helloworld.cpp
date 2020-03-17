#include <stdio.h>
#include "hellofunctions.h"


#ifndef TEST


int main(void)
{

    char str[128];
    getHelloWorldMessage(1, str);
    printf("%s", str);
    getHelloWorldMessage(2, str);
    printf("%s", str);
    int v = 2;
    
    printf("Hello SCRATCh world!\n");
    printf("Hello Hamburg!\n");
    printf("Hello Rotterdam!\n");
    printf("Hello Bremen!\n");
    printf("Hello Online!\n");
    printf("Hello Team!\n");
    printf("1 + 1 = %d\n", v);
    
    return 0;
}
#endif // !TEST



