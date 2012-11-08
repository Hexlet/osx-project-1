//
//  EfxDNA Sample project
//  Cell category (mutator)
//  (c) 2012, deksden.com
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)percentOfMutation
{
    // check param - if it is really a percent:
    if (percentOfMutation < 0 )
        percentOfMutation = 0;
    if (percentOfMutation > 100)
        percentOfMutation = 100;
    
    int numberOfDNAForReplace = (self.getDNACount * percentOfMutation / 100);
    
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    int i;

    NSLog(@"mutate: will be mutated %d DNA etries of %ld", numberOfDNAForReplace, self.getDNACount);
    
    // init array of indexes:
    for (i=0; i < self.getDNACount ; i++)
    {
        [indexArray addObject:[NSNumber numberWithUnsignedInt:i]];
    }
    
    // shuffle index array:
    for (i=0; i < indexArray.count; i++)
    {
        [indexArray exchangeObjectAtIndex: i withObjectAtIndex: arc4random_uniform( indexArray.count - 1.0 )];
    }

    // now mutate specified number of items in DNA array:
    for (i=0; i < numberOfDNAForReplace; i++ )
    {
#ifdef EFXDEBUG
        NSLog( @"changing DNA %d of %d: #%@", i+1, numberOfDNAForReplace, [indexArray objectAtIndex:i ]);
#endif
        NSString *newDNAValue;

        // generate new random value until it is not same value:
        do
        {
            newDNAValue = [self getDNAByIndex: arc4random_uniform(self.DNAVariations) ];
#ifdef EFXDEBUG
            NSLog(@"  new value %@, current value: %@", newDNAValue, [self getDNAAtIndex: i ] );
#endif
        }while(newDNAValue == [self  getDNAAtIndex: [[indexArray objectAtIndex: i] intValue] ]);
        
        // replace value with NEW value:
        [self replaceDNAAtIndex:[[indexArray objectAtIndex:i] intValue] withValue:newDNAValue];
    }
}

@end
