//
//  EfxDNA Sample project
//  Cell class
//  (c) 2012, deksden.com
//

#import "Cell.h"

@implementation Cell
{
    NSMutableArray *DNA;
}


-(id) initWithCapacity:(int)aCapacity;
{
    self = [super init];
    
    if (!self)
        return nil; // test if memory allocation fail, then return nil - i dont like nested code blocks)

    // init properties:
    _DNACapacity = aCapacity;
    _DNAVariations = 4;
    
    DNA = [[NSMutableArray alloc] initWithCapacity: _DNACapacity];
    
    // init DNA array with values:
    for (int i=0; i < _DNACapacity; i++)
    {
        [DNA addObject: [self getDNAByIndex: arc4random_uniform(_DNAVariations)]];
    }
    
    return self;
}

-(id) init;
{
    return [self initWithCapacity:100];
}

-(int) hammingDistance:(Cell *) cell
{
    int counter = 0;
    
    if ([DNA count] > [cell getDNACount] )
    {
        NSLog(@"hammingdistance: cell is too small! DNA count is %ld, and Cell.DNA count is %ld",[DNA count], [cell getDNACount]);
        return -1; // fail: cell is too small!
    }
    
    for (int i=0; i< [DNA count]; i++)
    {
        if ([DNA objectAtIndex:i] != [cell getDNAAtIndex:i])
          counter++;
    }
    
    return counter;
}

-(NSString*) getDNAAtIndex:(int)aIndex
{
    return [DNA objectAtIndex:aIndex];
}

-(NSUInteger) getDNACount;
{
    return [DNA count];
}

-(NSString *) getDNAByIndex:(int)aIndex;
{
    NSString *aString = nil;
    
    if (aIndex == 0)
        aString = [NSString stringWithFormat:@"A"];
    else if (aIndex == 1)
        aString = [NSString stringWithFormat:@"T"];
    else if (aIndex == 2)
        aString = [NSString stringWithFormat:@"G"];
    else if (aIndex == 3)
        aString = [NSString stringWithFormat:@"C"];
    else
        NSLog( @"getDNAByIndex: invalid index for DNA: %d", aIndex); // maybe later replace by exception

    return aString;
}

-(void) replaceDNAAtIndex:(int)aIndex withValue:(NSString *)newValue;
{
    [DNA replaceObjectAtIndex:aIndex withObject:newValue];
}

#ifdef EFXDEBUG
-(void) logDNA;
{
    for(int i=0; i < [self getDNACount]; i++)
    {
        NSLog(@"%@ cell1.DNA[%d] = %@", _logPrefix, i, [self getDNAAtIndex:i]);
    }
}
#endif

@end
