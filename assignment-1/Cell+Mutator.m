#import "Cell+Mutator.h"
#import "NSArray+GetRandomObjectGetter.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    NSMutableArray *dna = [self DNA];
    
    for (uint i = 0; i < percent; i++) {
        [dna insertObject: [elements getRandomObject] atIndex: i];
    }
}

@end