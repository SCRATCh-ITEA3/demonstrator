#include "hellofunctions.h"
#include <string.h>

void getHelloWorldMessage(int messType, char* message)
{

    if (messType == 1)
        strcpy(message, "Hello SCRATCh world!\n");
    else if (messType == 2)
        strcpy(message, "Hello Hamburg\n");

}
