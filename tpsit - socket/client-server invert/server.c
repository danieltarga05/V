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

#define SERVER_PORT 40000
#define DIM 512

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

    if(strcmp(reverse,check)==0)
    {
        return 1;
    }
    return 0;
}


int main(int argc, char *argv[])
{
    struct sockaddr_in servizio, remoto;

    memset((char *)&servizio, 0, sizeof(servizio));
    
    servizio.sin_family = AF_INET;
    servizio.sin_addr.s_addr = htonl(INADDR_ANY);
    servizio.sin_port = htonl(SERVER_PORT);

    int socketfd = socket(AF_INET,SOCK_STREAM,0);
    int option = 0; //opzione
    setsockopt(socketfd,SOL_SOCKET,SO_REUSEADDR,&option,sizeof(option));
    bind(socketfd,(struct sockaddr *)&servizio,sizeof(servizio));

    listen(socketfd, 10);

    for(;;)
    {
        printf("\nServer in ascolto...\n");
        fflush(stdout);
        
        int size = sizeof(servizio), soa, nread; //per la funzione accept è necessario un indirizzo di memoria
        if(soa = accept(socketfd,(struct sockaddr *)&remoto,&size) == -1)
        {
            printf("Errore nella connessione al client.\n");
            exit(1);
        }
        printf("Connessione al client avviata.\n");
        
        char buff, stringa_client[DIM];
        int i=0;
        while(nread = read(soa,&buff,sizeof(buff))>0)
        {
            stringa_client[i++]=buff;
        }

        char result[50];
        if(palindroma(stringa_client))
        {
            strcat(result,"la stringa inserita è palindroma");
        }
        else
        {
            strcat(result,"la stringa inserita non è palindroma");
        }
        
        write(soa,result,strlen(result));
        close(soa);
    }

    close(socketfd);
    return 0;
}