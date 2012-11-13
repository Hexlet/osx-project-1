#import "Cell.h"

@implementation Cell

@synthesize dna = _dna;

-(id)init
{
    self = [super init];
    if(self)
    {
        _dna = [[NSMutableArray alloc] init];
        
        for(int i=0; i<100; i++)
            [_dna addObject: [NSString stringWithString: [self getRandomSym:nil]]];
    }
    
    return self;
}

-(id)description
{
    return [_dna componentsJoinedByString:@""];
}

-(NSString*)getRandomSym:(NSString *)x
{
    NSArray *arr = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    if(x && [arr containsObject:x])
        return [arr objectAtIndex:([arr indexOfObject:x] + 1 + rand()%[arr count]-1)%rand()%[arr count]];
        return [arr objectAtIndex:rand()%[arr count]];
}

-(int)hammingDistance: (Cell*)other
{
    int result = 0;
    
    if([_dna count] != [other.dna count])
    {
        result = -1;
    }
    else
    {
        for(int i=0; i<_dna.count; i++)
            if([_dna objectAtIndex:i] != [other.dna objectAtIndex:i])
                result++;
    }
    
    return result;
}

@end
