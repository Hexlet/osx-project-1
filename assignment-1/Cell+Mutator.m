#import "Cell+Mutator.h"
#import "NSArray+GetRandomObjectGetter.h"

@implementation Cell (Mutator)

- (void)mutate:(int)mutatePercent {
    NSMutableArray *randomUniqueIndexes = [[NSMutableArray alloc] initWithCapacity:mutatePercent];
    NSUInteger randomIndex;

    for (uint i = 0; i < mutatePercent; i++) {
        randomIndex = arc4random() % 100;

        while ([randomUniqueIndexes containsObject:[NSNumber numberWithInteger:randomIndex]]) {
            randomIndex = arc4random() % 100;
        }

        [randomUniqueIndexes insertObject:[NSNumber numberWithInteger:randomIndex] atIndex:i];
    }

    NSString *currentCell, *randomCell;

    for (NSNumber *randomIndex in randomUniqueIndexes) {
        currentCell = [dna objectAtIndex:[randomIndex intValue]];
        randomCell  = [dnaItems getRandomObject];

        while ([currentCell isEqualToString:randomCell]) {
            randomCell = [dnaItems getRandomObject];
        }

        [dna replaceObjectAtIndex:[randomIndex intValue] withObject:randomCell];
    }
}

@end