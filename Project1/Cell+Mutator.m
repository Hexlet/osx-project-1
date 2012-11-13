#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void)mutate: (int)percent
{
    if(percent<=0) return;
    
    if(percent>100) percent = 100;
    
    int amount = (int)roundf([_dna count]*percent/100.0f);
    
    NSMutableArray *indicies = [[NSMutableArray alloc] init];
    for(int i=0; i<[_dna count]; i++)
        [indicies addObject:[NSNumber numberWithInt:i]];
    
    for(int i=0; i<amount; i++)
    {
        int randomKey = rand()%[indicies count];
        int indexToModify = [[indicies objectAtIndex:randomKey] integerValue];
        [_dna replaceObjectAtIndex:indexToModify withObject:[self getRandomSym:[_dna objectAtIndex:indexToModify]]];
        
        [indicies removeObjectAtIndex:randomKey];
    }
}

@end
