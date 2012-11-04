//
//  Cell.m
//  DNA	
//
//  Created by Mac User on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"
#import<time.h>


@implementation Cell

-(id)init
{
    char ATGC[4] = {'A','T','G','C'};
            
    if(self=[super init])
        {
        DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0;i<100;i++)
        {
            int a=rand()%4;
            NSNumber *ch = [NSNumber numberWithChar:ATGC[a]];
            [DNA addObject:ch];
        }
    }
    return self;
} //init

-(void)print
{
    for (int i=0;i<100;i++)
    {
        NSNumber *ch = [DNA objectAtIndex:i]; 
        char a = [ch charValue];
        printf("%c",a);
    }
    puts("\n");
    
}//print

-(int)hammingDistance:(Cell *)cell1
{
    int dist=0;
    
    if (cell1==self) return 0;
    
    for (int i=0;i<100;i++)
    {
        NSNumber *ch = [DNA objectAtIndex:i]; 
        NSNumber *ch1 = [cell1->DNA objectAtIndex:i];
        if([ch charValue]!=[ch1 charValue])
            dist++;
    }
    return dist;
}//distance

@end
