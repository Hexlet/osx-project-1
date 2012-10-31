#import "Cell.h"


const NSString *DNAItems[kMaxDNAItems] = {@"A", @"T", @"G", @"C"};

@implementation Cell

@synthesize dna;

- (id) init
{
    if(self = [super init])
    {
        dna = [[NSMutableArray alloc] initWithCapacity: kDNALength];
        
        for(int i = 0; i < kDNALength; i++)
        {
            [dna addObject: DNAItems[arc4random()%kMaxDNAItems]];
        }
    }
    
    return self;
}

+ (id) cell
{
    return [[[self alloc] init] autorelease];
}

- (void) dealloc
{
    [dna release];
    
    [super dealloc];
}

- (NSString *) description
{
    return [dna componentsJoinedByString: @""];
}

- (unsigned) hammingDistance: (Cell *) cell
{
    unsigned dist = 0;
    
    for(int i = 0; i < kDNALength; i++)
    {
        if([dna objectAtIndex: i] != [cell.dna objectAtIndex: i])
        {
            dist++;
        }
    }
    
    return dist;
}

@end