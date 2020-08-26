#include "stdio.h"

/**
   Access stack memory out of bounds.

   Used to demonstrate basic cpp check functionality.

*/
int cppcheck_outofbounds(void) {
  int buffer[100];

  for (int i=0;i<=sizeof(buffer);i++){
    buffer[i]=i;
  }
}

/**
   Function that is never used.

   Used to demonstrate that cpp check identifies unused functions.
*/
int cppcheck_never_used() {
  printf("This function is never used");
}
