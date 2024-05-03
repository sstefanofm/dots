#include <stdio.h>

int
print_bin(int n)
{
  if (n)
    print_bin(n >> 1);
  printf("%d", n & 1);
}

int
str_len(char *str)
{
  int i;

  for (i = 0; str[i] != '\0'; ++i)
    ;

  return i;
}

int
pow_n(int base, int n)
{
  if (n == 0)
    return 1;

  int x = base;

  for (int i = 1; i < n; ++i)
    x *= base;

  return x;
}

int
parse_int(char *n)
{
  int l = str_len(n);
  int d = 0;

  for (int i = 0; i < l; ++i)
    d += (n[i] - 48) * pow_n(10, l - i - 1);

  return d;
}

int
main(int argc, char **argv)
{
  if (argc == 1)
    return 1;

  for (int i = 1; i < argc; ++i) {
    int n = parse_int(argv[i]);

    printf("%d = ", n);
    print_bin(n);
    putchar('\n');
  }

  return 0;
}
