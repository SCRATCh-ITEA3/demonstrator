

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

    

    printf("Hello SCRATCh world!\n");
    printf("Hello Technical Round Team!\n");
    printf("Hello Bremen!\n");
    printf("Hello Hamburg!\n");
    printf("Hello Online!\n");
    printf("Hello Rotterdam!\n");
    printf("Hello Team!\n");

    printf("Hello Home Office\n");
    printf("Hot code check\n");

    return 0;
}
#endif // !TEST






