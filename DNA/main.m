//
//  main.m
//  DNA
//
//  Created by Mac User on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell(mutator)

-(void)mutate:(int)proc;

@end

@implementation Cell(mutator)

-(void)mutate:(int)proc
{
    int changed[100]={0};
    char ATGC[4] = {'A','T','G','C'};
    char newch = ATGC[rand()%4];
    while(proc)
    {
        int i = rand()%100;
        if(changed[i]==0)
        {
            char ch = [[DNA objectAtIndex:i] charValue];

            while(ch==newch)
                  newch = ATGC[rand()%3];
            
            [DNA replaceObjectAtIndex:i withObject:[NSNumber numberWithChar:newch]];
            changed[i]++;
            proc--;
        }
    }
}//mutate

@end


int main (int argc, const char * argv[])
{
    @autoreleasepool {
        
        srand(time(NULL));
        
        Cell *myCell = [[Cell alloc] init];
        Cell *myCell1 = [[Cell alloc] init];
        [myCell print];
        [myCell1 print]; 
        printf("Hamming distance before mutate is %d\n",[myCell hammingDistance:myCell1]);
        puts("--------------------\nMutating...\n--------------------");
        [myCell mutate:50];
        [myCell mutate:100];

        [myCell print];
        [myCell1 print];   
        printf("Hamming distance after mutate is %d\n",[myCell hammingDistance:myCell1]); 
    }
    return 0;
}

