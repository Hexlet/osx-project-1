//
//  Cell.m
//  DNA
//
//  Created by Elena Grasovskaya on 12/24/12.
//  Copyright (c) 2012 Sergey Grasovskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize capacity;
@synthesize name;

-(id)init
{
    if(self = [super init])
    {
        self.name = @"DNA";
        capacity = 100;
        arNukl = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
        [self createDNA];        
    }    
    return self;
        
} //init

//
//---------------------------------
//

- (void) createDNA
{
    
    int index=0;
    
    dna = [NSMutableArray arrayWithCapacity:self.capacity];
    for(int i=0; i<self.capacity; i++)
    {
        index = (int)(random() % 4);        
        dna[i] = [arNukl objectAtIndex:index];
    }
    srandom((unsigned)time(NULL));    
} //createDNA

//
//---------------------------------
//

-(NSString*) dnaAtIndex:(int)index
{
    return [dna objectAtIndex:index];
}

//
//---------------------------------
//

-(int)hammingDistance:(Cell *)cell2
{
    int distance=0;
    for (int i=0; i<self.capacity; i++)
    {
        if([dna objectAtIndex:i] != [cell2 dnaAtIndex:i] )
        {
            ++distance;
            //NSLog(@"DNA1:%@ |  DNA2:%@    --- distance: %i",[dna objectAtIndex:i], [cell2 dnaAtIndex:i], distance);
        }
        //else
            //NSLog(@"DNA1:%@ |  DNA2:%@",[dna objectAtIndex:i], [cell2 dnaAtIndex:i]);
    }
    
    return distance;
} //hammingDistance

//
//---------------------------------
//

-(void)print
{
    NSLog(@"DNA: %@",dna);
}//print

@end 
