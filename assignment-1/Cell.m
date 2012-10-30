#import "Cell.h"
#import "NSArray+GetRandomObjectGetter.h"

@implementation Cell

@synthesize DNA;
@synthesize DNAItems;

- (id)init {
    self = [super init];
    
    DNAItems = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
    
    DNA = [[NSMutableArray alloc] initWithCapacity: 100];
    
    for (uint i = 0; i < 100; i++) {
        [DNA addObject: [DNAItems getRandomObject]];
    }
    
    return self;
}

- (int)hammingDistance:(Cell *)dna {
    uint hd = 0;
    
    for (uint i = 0; i < 100; i++) {
        NSString *s1 = [[self DNA] objectAtIndex: i];
        NSString *s2 = [[dna DNA] objectAtIndex: i];
        
        if (![s1 isEqualToString: s2]) {
            hd++;
        }
    }
    
    return hd;
}

@end