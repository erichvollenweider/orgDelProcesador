#include <stdio.h>

extern int asm_main();

int main()
{
  int ret_status;
  ret_status = asm_main();
  printf("%d", ret_status);
  return ret_status;
}
