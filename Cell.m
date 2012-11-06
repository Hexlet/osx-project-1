#import "Cell.h"

@implementation Cell 

-(id)init: {
    self = [super init]
    if (self){
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        int i;
        NSArray *nucleotids = [[NSArray alloc] initWithObjects: @"A", @"G", @"T", @"C", nil]
        for (i = 0; i < 100; i++) {
            [_DNA addObject: [nucleotids objectAtIndex:arc4random() % 4]];
        }

    }
    [self setNumerator: self.numerator*f.denominator + self.denominator*f.numerator];
    [self setDenominator:self.denominator * f.denominator];
}

-(int)hammingDistance:(Cell *) compare {
    int hd = 0;
    int i;
    for (i=0; i < 100; i++){
        if ( [_DNA objectAtIndex:i] != [[compare DNA] objectAtIndex:i]){
            hd++;
        }
    }
    return hd;
}

@end