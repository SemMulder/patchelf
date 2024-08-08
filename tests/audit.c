#include <link.h>
#include <stdio.h>

unsigned int la_version(unsigned int version)
{
    fprintf(stderr, "This is audit!\n");
    return version;
}
