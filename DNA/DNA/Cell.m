//
//  Cell.m
//  DNA
//
//  Created by Straga on 06.11.12.
//  Copyright (c) 2012 Straga. All rights reserved.
//

#import "Cell.h"

const NSString *acid[4] = {@"A", @"T", @"G", @"C"};

static const NSString* mutateAcid(NSString *item)
{
    int index = arc4random()%4;
    
    if(acid[index] == item)
    {
        switch(index)
        {
            case 0:
                index += arc4random()%(4 - 1) + 1;
                break;
                
            case (4 - 1):
                index -= arc4random()%(4 - 1) + 1;
                break;
                
            default:
                index += arc4random()%2 ? arc4random()%(4 - index - 1) + 1
                : -arc4random()%index - 1;
                break;
        }
    }
    
    return acid[index];
}

static inline void swapArrayItems(unsigned *arr, unsigned i, unsigned j)
{
    arr[i] ^= arr[j]; arr[j] ^= arr[i]; arr[i] ^= arr[j];
}


@implementation Cell

-(id) init{
    self = [super init];
    if (self) {
        
        _dna = [[NSMutableArray alloc] initWithCapacity: 100];
        
        for(int i = 0; i < 100; i++)
        {
            [_dna addObject: acid[arc4random()%4]];
        }
    }
    
    return self;
}

-(int) hammingDistance:(Cell *)reactiv{
    
    unsigned dist = 0;
    
    for(int i = 0; i < 100; i++)
    {
        if([_dna objectAtIndex: i] != [reactiv.dna objectAtIndex: i])
        {
            dist++;
        }
    }
    
    return dist;
}

- (NSString *) description
{
    return [_dna componentsJoinedByString: @""];
}

@end


@implementation Cell (Mutator)

- (void) mutate: (int) percentage
{
    assert((percentage >= 0) && (percentage <= 100));
    
    if(percentage == 0) return;
    
    unsigned indices[100];
    for(unsigned i = 0; i < 100; i++)
    {
        indices[i] = i;
    }

    for(unsigned i = 0; i < 100 - 1; i++)
    {
        swapArrayItems(indices, i, arc4random()%(100 - i - 1) + i + 1);
    }
    
    unsigned mutationLength = (unsigned)roundf((float)100/100.0f*percentage);
    
    for(unsigned i = 0; i < mutationLength; i++)
    {
        [_dna replaceObjectAtIndex: indices[i] withObject: mutateAcid([_dna objectAtIndex: indices[i]])];
    }
}

@end