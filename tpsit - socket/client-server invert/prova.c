#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <string.h>
#include <fcntl.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>

void str_reverse(char source[],char dest[])
{
    for(int i = 0; i<strlen(source);i++)
    {
        dest[i]=source[strlen(source)-i-1];
    }
    return;
}
int palindroma(char stringa[])
{
    char reverse[strlen(stringa)], check[strlen(stringa)];
    str_reverse(stringa,reverse);
    strcpy(check,stringa);

    printf("%s",reverse);

    if(strcmp(reverse,check)==0)
    {
        return 1;
    }
    return 0;
}

int main()
{
    int ritorno ;
    if(ritorno=palindroma("andrea"))
        printf("%d\n",ritorno);
    else
        printf("ciao");

    return 0;
}