#include <string.h>
#include <stdlib.h>

/**

This file contains a few example to trigger cppcheck rules.
*/

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


/**
   Returning reference to temporary variable
*/
int* cppcheck_ref_to_temp() {
  int local_variable = 0;

  return &local_variable;
}

/** 
    Dangerous use of strncat()
*/
int cppcheck_strncat(char *in) {

  char dest[100];

  /*init everything to string termination*/
  memset(dest,'\0',100);

  /*concat strings, 100 bytes left*/
  strncat (dest,in,100);
  /*concat strings, 100 bytes left here, actually less than 100 bytes
    are left. Third parameter is buffer left space, not size.
   */
  strncat (dest,in,100);
  return 0;
  
}

/**
   Mixed arguments in memset.
*/
int cppcheck_memset(char *ptr) {
  /*intention was to write 100 bytes of 0, not 0 bytes of 100*/
  memset(ptr,100,0);
}


/**
   Double free of pointer.
*/
int cppcheck_double_free(){
  char *ptr = malloc(100);
  if (ptr){
    free(ptr);
    free(ptr);
  }
}


/**
   Forget to check if malloc succeeded.
*/
int cppcheck_malloc() {
  char *ptr = malloc(100);
  ptr[6]=0;
  free(ptr);
  return 0;
}


/**
   Forget to free memory.
*/
int cppcheck_malloc() {
  char *ptr = malloc(100);

  return 0;
}


int cppcheck_div_zero() {
  int zero = 0;
  return 5/zero;
}


int cppcheck_sizeof(char arg[]){
  int i;
  /*this easily happens if you move code inside a function, hence
    creation of argument out of current scope*/
  for (i=0;i<sizeof(arg);i++){
    arg[i]=i;
  }
  
}
