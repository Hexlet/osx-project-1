//
//  Cell.m
//  Project1
//
//  Created by brevis on 10/31/12.
//  Copyright (c) 2012 brevis. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

-(id)init
{
    self = [super init];
    if ( self )
    {
        possibleGenes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0;i<100;i++)
        {
            [DNA addObject:[possibleGenes objectAtIndex:arc4random()%4]];
        }
    }
    
    return self;
}

-(int)hammingDistance:(Cell *)cell
{
    int count = 0;
    
    for (int i=0;i<100;i++)
    {
        if ( ![[DNA objectAtIndex:i] isEqualTo:[cell.DNA objectAtIndex:i]] ) count++;
    }
    
    return count;
}

@end


#pragma mark - Category "mutator"

@implementation Cell (mutator)

-(void)mutate:(int)x
{
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:100];
    for (int i=0; i<100; i++)
    {
        [indexes addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
    [self shuffle:indexes];
 
    if ( x<0 || x>100 )
    {
        NSLog(@"Wrong percent %d. Correct percent will be generate random.", x);
        x = arc4random() % 101;
    }
    
    //x percents == x items (because length of DNA=100)
    for (int i=0; i<x; i++)
    {
        NSString *g = [self.DNA objectAtIndex:[[indexes objectAtIndex:i] intValue] ];
        [self.DNA replaceObjectAtIndex:[[indexes objectAtIndex:i] intValue] withObject:[self getRandomGeneExclude:g]];
    }
}

-(void)shuffle:(NSMutableArray*)array
{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; ++i)
    {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(NSString*)getRandomGeneExclude:(NSString *)gene
{
    NSString *g;
    
    do {
        g = [possibleGenes objectAtIndex:arc4random()%4];
    } while ( [g isEqualToString:gene] );
    
    return g;
}

@end
