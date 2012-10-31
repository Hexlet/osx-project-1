#import "Cell.h"
#import "NSArray+GetRandomObjectGetter.h"

@implementation Cell

@synthesize dna;
@synthesize dnaItems;

- (id)init {
    self = [super init];
    
    dnaItems = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    dna = [[NSMutableArray alloc] initWithCapacity: 100];
    
    for (uint i = 0; i < 100; i++) {
        [dna addObject: [dnaItems getRandomObject]];
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)cell {
    uint hd = 0;
    
    for (uint i = 0; i < 100; i++) {
        NSString *s1 = [[self dna] objectAtIndex: i];
        NSString *s2 = [[cell dna] objectAtIndex: i];
        
        if (![s1 isEqualToString: s2]) {
            hd++;
        }
    }
    
    return hd;
}

@end