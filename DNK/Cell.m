//
//  Cell.m
//  DNK
//
//  Created by Michael Blinchevsky on 11/4/12.
//  Copyright (c) 2012 aia. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(NSString*)getDNAchar
{
   NSString* str = @"ATGC";
   int strLen = (int)[str length];
   int ichar =arc4random_uniform(strLen);
   return [NSString stringWithFormat:@"%c", [str characterAtIndex:ichar]];
}

-(id)init
{
    self = [super init];
    arr = [[NSMutableArray alloc] initWithCapacity:100];
    name = @"unknown";
    for (int i = 0; i < 100; ++i)
        [arr addObject: [self getDNAchar]];
    return self;
}

-(id)initWithName: (NSString*)ofname
{
    self = [self init];
    name = ofname;
    return self;
}

-(const NSMutableArray*)getArr
{
    return arr;
}
-(NSMutableString*) arrToStr
{
    NSMutableString* s = [[NSMutableString alloc] init];
    for (int i = 0; i < [arr count]; ++i)
        [s appendString:[arr objectAtIndex:i]];
    return s;
}

-(int)hammingDistance: (Cell*)fromCell
{
    if (fromCell == NULL)
        return (int)[arr count];
    
    int retval = 0;
    for (int i = 0; i < (int)[arr count]; ++i)
        if ([[fromCell getArr] objectAtIndex: i] != [arr objectAtIndex: i])
            ++retval;
    return retval;
}

-(void)print
{
    NSLog(@"%@ DNA size: %i", name, (int)[arr count]);
    NSLog(@"%@ DNA: %@", name, [self arrToStr]);
}

-(void)mutate:(int)celldamage
{
    if (celldamage <= 0)
        return;

    if (celldamage > 100)
        celldamage = 100;
    
    int icnt = (int)[arr count]*celldamage/100;
    NSMutableArray* changes = [[NSMutableArray alloc] init];
    while (true)
    {
        int ipos =arc4random_uniform((int)[arr count]);
        bool isduplicate = false;
        for (int i = 0; i < [changes count]; ++i)
            if ((int)[changes objectAtIndex:i] == ipos)
            {
                isduplicate = true;
                break;
            }
        if (isduplicate)
            continue;
        [changes addObject:[NSNumber numberWithInt:ipos]];
        
        NSString* curval = [arr objectAtIndex:ipos];
        NSString* newval = [self getDNAchar];
        while (curval == newval)
            newval =[self getDNAchar];
        
        [arr setObject:newval atIndexedSubscript:ipos];
        if ([changes count] >= icnt)
            break;
    }
}

@end


