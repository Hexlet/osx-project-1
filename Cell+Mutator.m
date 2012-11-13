#import "Cell+Mutator.h"
#import <stdlib.h>

@implementation Cell (Mutator)

- (void) mutate: (NSUInteger) percents {
	percents = (percents > 100) ? 100 : percents;
	NSUInteger actualElementsCount = [_DNA count] / 100 * percents;
    NSUInteger affectedElements[actualElementsCount];
	for (NSUInteger i = 0; i < actualElementsCount; i++) {
		NSUInteger randomElement = arc4random() % [_DNA count];
		BOOL isUnique = YES;
		for (NSUInteger j = 0; j < actualElementsCount; j++) {
			if (affectedElements[j] == randomElement) {
				isUnique = NO;
				i--;
				break;
			}
		}
		if (isUnique) {
			affectedElements[i] = randomElement;
            NSString* currentNucleobase = [_DNA objectAtIndex: randomElement];
            NSString* newNucleobase;
            do {
                newNucleobase = [nucleobases objectAtIndex: arc4random() % [nucleobases count]];
            } while ([newNucleobase isEqualTo: currentNucleobase]);
            [_DNA removeObjectAtIndex: randomElement];
            [_DNA insertObject: newNucleobase atIndex: randomElement];
		}
	}
}

@end
