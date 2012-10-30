#import "Cell+Mutator.h"
#import "NSArray+GetRandomObjectGetter.h"

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    for (uint i = 0; i < percent; i++) {
        [DNA insertObject: [DNAItems getRandomObject] atIndex: i];
    }
}

@end