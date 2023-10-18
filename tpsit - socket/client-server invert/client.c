#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <string.h>
#include <fcntl.h>
#include <signal.h>
#include <errno.h>
#include <ctype.h>
#include <unistd.h>

#define DIM 50
int main(int argc, char *argv[])
{

    if(argc != 3)
    {
        exit(1);
    }

    struct sockaddr_in servizio;
    int socketfd;

    memset((char *)&servizio, 0 , sizeof(servizio));

    servizio.sin_family = AF_INET;
    servizio.sin_addr.s_addr = inet_addr(argv[1]);
    servizio.sin_port = htons(atoi(argv[2]));

    socketfd = socket(AF_INET, SOCK_STREAM,0);
    connect(socketfd,(struct sockaddr *)&servizio, sizeof(servizio));
    printf("Connessione stabilita.\n");

    char buff[DIM];
    printf("Inserire stringa : ");
    scanf("%s",buff);
    write(socketfd,buff,sizeof(buff)); //invio al server

    read(socketfd,buff,sizeof(buff));  //ricezione del risultato
    write(1, buff, strlen(buff));
    close(socketfd);
    printf("%s",buff);
    return 0;


}