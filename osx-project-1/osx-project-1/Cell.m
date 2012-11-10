

#import "Cell.h"
@interface Cell() {
}

@end

@implementation Cell

- (NSString *)description {
    return self.DNA.description;
}

- (id)init {
    self = [super init];
    if (self) {
        _capacity = 100;
        _DNAItems = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        _DNA = [[NSMutableArray alloc] initWithCapacity:_capacity];
        _randoms = [[NSMutableArray alloc] initWithCapacity:_capacity];

        for (int i = 0; i < _capacity; i++) {
            [self.DNA addObject:[self.DNAItems objectAtIndex:(int) random() % self.DNAItems.count]];
            [_randoms addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    return self;
}

- (NSInteger)hammingDistance:(Cell *)other {
    if (!other) return -1;
    NSInteger counter = 0;
    for (NSUInteger i = 0; i < _capacity; i++) {
        if ([self.DNA objectAtIndex:i] != [other.DNA objectAtIndex:i]) counter++;
    }

    return counter;
}


@end
