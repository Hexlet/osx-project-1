#import "Cell.h"

@implementation Cell
-(id)init {
    self = [super init];
    if (self) {
        _nucleotides = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        _DNA = [[NSMutableArray alloc] init];
        for (i=0; i<99; i++) {
            j = arc4random()%4;
            [_DNA insertObject:[_nucleotides objectAtIndex:j] atIndex:i];
        }
    }
    return self;
}
-(int)hammingDistance:(NSMutableArray*)incomeArray {
    _distance = 100;
    for (i = 0; i < _distance; i++) {
        if ([_DNA objectAtIndex:i] != [incomeArray objectAtIndex:i]) {
            _distance--;
        }
    }
    // return _distance;
    NSLog(@"%i", _distance);
}
@end