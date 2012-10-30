//
//  Cell+Mutator.m
//  DNA
//
//  Created by Alexander on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>
#import "Cell+Mutator.h"


static NSString* mutateDNAItem(NSString *item)
{
    unichar c = [item characterAtIndex: 0];
    NSMutableArray *allowedDNAItems = [[NSMutableArray alloc] initWithCapacity: (kMaxDNAItems - 1)];
    for(int i = 0; i < kMaxDNAItems; i++)
    {
        if(DNAItems[i] != c)
        {
            [allowedDNAItems addObject: [NSString stringWithFormat: @"%c", DNAItems[i]]];
        }
            
    }
    
//    NSLog(@"(%@ -> %@)", item, (NSString *)[allowedDNAItems objectAtIndex: (arc4random()%(kMaxDNAItems - 1))]);
    
    return (NSString *)[allowedDNAItems objectAtIndex: (arc4random()%(kMaxDNAItems - 1))];
}

static NSMutableArray* arrayWithRange(NSRange r)
{
    NSMutableArray *a = [NSMutableArray arrayWithCapacity: r.length];
    for(int i = 0; i < r.length; i++)
    {
        [a addObject: [NSNumber numberWithInteger: (r.location + i)]];
    }
    
    return a;
}

static NSMutableArray* shuffledArrayWithRange(NSRange r)
{   
    NSMutableArray *a = arrayWithRange(r);
    
    NSUInteger arrLength = [a count];
    for(NSUInteger i = 0; i < (arrLength - 1); i++)
    {
        NSUInteger j = arc4random()%(arrLength - i) + i;
        
        [a exchangeObjectAtIndex: i withObjectAtIndex: j];
    }
    
    return a;
}

@implementation Cell (Mutator)

- (void) mutate: (unsigned) percentage
{
    if(percentage == 0) return;
    if(percentage > 100) percentage = 100;
    
    unsigned itemsForMutationNumber = (unsigned)roundf((float)kDNALength/100.0f*percentage);
    
//    NSLog(@"%i", itemsForMutationNumber);
    
    NSArray *dnaIndicesForMutation = shuffledArrayWithRange(NSMakeRange(0, kDNALength));
    
//    NSLog(@"%@", [dnaIndicesForMutation componentsJoinedByString: @", "]);
    
    unsigned mutatedItemsCounter = 0;
    for(NSNumber *num in dnaIndicesForMutation)
    {
        if(mutatedItemsCounter >= itemsForMutationNumber)
        {
            return;
        }
        
        NSUInteger index = [num integerValue];
        [dna replaceObjectAtIndex: index withObject: mutateDNAItem([dna objectAtIndex: index])];
        
        mutatedItemsCounter++;
    }
}

@end
