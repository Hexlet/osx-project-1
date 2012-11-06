
#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) X;

@end

@implementation Cell (mutator)

-(void) mutate: (int) X
{
    //Creates shuffled array of indexes. First X elements of shuffled array are used to change the DNA array.  
    
    int randNum;
    NSMutableArray *shuffle = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; i++) [shuffle addObject:[NSNumber numberWithInt:i]];
    for (int i = 100 - 1; i > 0; --i) [shuffle exchangeObjectAtIndex:(arc4random() % (i+1)) withObjectAtIndex:i];
    for (int i = 0; i < X; i++) {
        randNum = arc4random_uniform(4);
        [self.DNA replaceObjectAtIndex:[[shuffle objectAtIndex:i] integerValue] withObject:[self.arrayOfDNAChars objectAtIndex:randNum]];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c = [[Cell alloc] init];
        Cell *a = [[Cell alloc] init];
        NSLog(@"Hamming distance before mutation equals %d", [c hammingDistance:a]);
        [c mutate:34];
        [a mutate:23];
        NSLog(@"Hamming distance after mutation equals %d", [c hammingDistance:a]);
        
    }
    return 0;
}

