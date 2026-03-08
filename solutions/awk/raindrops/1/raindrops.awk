# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
    if (num % 3 == 0) printf("Pling");
    if (num % 5 == 0) printf("Plang");
    if (num % 7 == 0) printf("Plong");
    if (num % 3 != 0 && num % 5 != 0 && num % 7 != 0) printf("%d", num);
}
