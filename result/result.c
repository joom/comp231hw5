#include <stdio.h>

int f (int x, int y, int z) {
    printf("(%d, %d, %d) \n", x, y, z);

    if (x <= y) {
        return y;
    } else {
        return f(f(x-1, y, z), f(y-1, z, x), f(z-1, x, y));
    }
}


int main()
{
  int a;
 
  printf("First arg\n");
  scanf("%d", &a);

  int b;
 
  printf("Second arg\n");
  scanf("%d", &b);

  int c;
 
  printf("Third arg\n");
  scanf("%d", &c);
 
  printf("Result is %d\n", f(a,b,c) );
 
  return 0;
}