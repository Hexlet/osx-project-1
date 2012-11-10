//
//  Cell+Mutator.m
//  osx-project-1


#import "Cell.h"

@interface  Cell(Mutator)
- (void)mutate:(NSInteger)x;
@end

@implementation Cell(Mutator)

- (void)mutate:(NSInteger)x {

    // shuffle
    int N = self.randoms.count;
    for (NSUInteger i = 0; i < N; i++) {
        NSUInteger r = i + random() % (N - i);
        [self.randoms exchangeObjectAtIndex:i withObjectAtIndex:r];
    }

    // mutate

    // number of items to mutate
    int count = (self.capacity * x) / 100;
    for (int i = 0; i < count; i++) {
        int dnaIndex =  [(NSNumber *)[self.randoms objectAtIndex:i] intValue];
        id currentItem = [self.DNA objectAtIndex:dnaIndex];
        int dnaItemIndex = [self.DNAItems indexOfObject:currentItem];
        int dnaItemIndexRandom = dnaItemIndex;

        // find an random index != dnaItemIndex
        while (dnaItemIndexRandom == dnaItemIndex)
            dnaItemIndexRandom = random() % (self.DNAItems.count);

        [self.DNA replaceObjectAtIndex:dnaIndex withObject:[self.DNAItems objectAtIndex:dnaItemIndexRandom]];
    }
}


@end
