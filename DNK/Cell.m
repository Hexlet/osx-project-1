#import "Cell.h"

@implementation Cell {
    NSArray *DNA;
}

-(id) init {
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
        _cellVariants = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 0; i <= DNA_LENGTH - 1; i++) {
            [_DNA addObject: self.getVariant];
        }
    }
    return self;
}

-(NSString *)getVariant {
    return [_cellVariants objectAtIndex:arc4random() % [_cellVariants count]];
}

-(int) hammingDistance:(Cell *)c {
    int distance = 0;
    for(int i = 0; i <= DNA_LENGTH - 1; i++) {
        if([self.DNA objectAtIndex:i] != [c.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}
@end