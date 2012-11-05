
#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *dna;
}

- (unsigned) hammingDistance: (Cell*) cell;

@end


@interface Cell (Mutator)

- (void) mutate: (unsigned) percentage;

@end