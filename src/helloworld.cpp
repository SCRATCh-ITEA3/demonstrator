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
    return 0;
}
#endif // !TEST



