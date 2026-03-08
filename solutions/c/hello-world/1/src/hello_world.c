#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include "hello_world.h"

void hello(char *buffer, const char *name)
{
    strcpy(buffer, "Hello, ");
    if(name == NULL)
        strcat(buffer, "World");
    else
        strcat(buffer, name);
    strcat(buffer, "!");
}