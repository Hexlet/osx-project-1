
#import <stdlib.h>
#import "Cell.h"

NSString * const DNAItems[4] = { @"A", @"T", @"G", @"C" };
const unsigned maxItemsNumber = 100;

@implementation Cell

- (id) init {
    
    self = [super init];
    
    if(self) {
        dna = [[NSMutableArray alloc] initWithCapacity: maxItemsNumber];
        
        for(int i = 0; i < maxItemsNumber; i++) {
            [dna addObject: DNAItems[arc4random() % 4]];
        }
    }
    
    return self;
}

- (unsigned) hammingDistance: (Cell *) cell {
    
    unsigned dist = 0;
    
    for (unsigned i = 0; i < maxItemsNumber; i++) {
        if([dna objectAtIndex: i] != [cell->dna objectAtIndex: i])
            dist++;
    }
    
    return dist;
}

- (NSString*) description
{
    return [dna componentsJoinedByString: @""];
}

@end


@implementation Cell (Mutator)

- (void) mutate: (unsigned) percentage {
    
    if(percentage <= 0 || percentage > 100)
        return;
    
    unsigned position;
    NSMutableArray * changedPositions = [[NSMutableArray alloc] init];
    NSString * newValue;
    
    percentage = round(maxItemsNumber / 100 * percentage);
    
    for (unsigned i = 0; i < maxItemsNumber; i++) {
        
        position = arc4random() % maxItemsNumber;
        
        while ([changedPositions containsObject:[NSNumber numberWithInt: position]]) {
            position = arc4random() % maxItemsNumber;
        }
        
        newValue = DNAItems[arc4random() % 4];
        
        while ([dna[position] isEqualTo: newValue]) {
            newValue = DNAItems[arc4random() % 4];
        }
        
        [dna replaceObjectAtIndex: position withObject: newValue];
    }
    
}

@end
