

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
    printf("For our demonstrator!\n");
    printf("Hello Everybody, Hamburg, Rotterdam!\n");

    return 0;
}
#endif // !TEST






