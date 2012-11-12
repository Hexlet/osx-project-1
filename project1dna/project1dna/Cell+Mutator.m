
#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) X {
    //Creates shuffled array of indexes. First X elements of shuffled array are used to change the DNA array.
    
    NSUInteger randNum;
    int count = [self.DNA count] * X / 100;
    NSMutableArray *shuffle = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (int i = 0; i < 100; i++) [shuffle addObject:[NSNumber numberWithInt:i]];
    for (int i = 100 - 1; i > 0; --i) [shuffle exchangeObjectAtIndex:(arc4random() % (i+1)) withObjectAtIndex:i];
    for (int i = 0; i < count; i++) {
        randNum = arc4random_uniform((int)[self.arrayOfDNAChars count]);
        if ([self.DNA objectAtIndex:i] != [self.arrayOfDNAChars objectAtIndex:randNum]) {
            [self.DNA replaceObjectAtIndex:[[shuffle objectAtIndex:i] integerValue] withObject:[self.arrayOfDNAChars objectAtIndex:randNum]];
        }
        else {
            NSMutableArray *tempDNAchars = [[NSMutableArray alloc] initWithArray:self.arrayOfDNAChars];
            [tempDNAchars removeObjectAtIndex:randNum];
            randNum = arc4random_uniform((int)[tempDNAchars count]);
            [self.DNA replaceObjectAtIndex:[[shuffle objectAtIndex:i] integerValue] withObject:[tempDNAchars objectAtIndex:randNum]];
            }
        }
    
}
@end
