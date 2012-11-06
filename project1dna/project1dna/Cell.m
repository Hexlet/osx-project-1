
#import "Cell.h"

@implementation Cell

- (id)init
{
    //Initilizing DNA array with capacity 100.
    
    self = [super init];
    if (self) {
        int randNum;
        int l = 100;
        _DNA = [[NSMutableArray alloc] initWithCapacity:l];
        _arrayOfDNAChars = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
        for (int i = 0; i < l; i++) {
            randNum = arc4random_uniform(4);
            [_DNA addObject:[_arrayOfDNAChars objectAtIndex:randNum]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cellObject
{
    // Checks if two literals at the same index are not equal, then increments count.
    int count = 0;
    NSInteger len = [_DNA count];
    cellDna = [cellObject DNA];
    for (int i = 0; i < len; i++) {
        if ([cellDna objectAtIndex:i] != [_DNA objectAtIndex:i])
            count += 1;
        else
            continue;
    }
    return count;
}
@end
