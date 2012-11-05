#import "Cell.h"
#import "NucleobaseType.h"

static int size = 100;

@implementation Cell

-(id) init {
    self = [super init];
    
    _dna = [NSMutableArray arrayWithCapacity:size];
    for (int i = 0; i < size; i++) {
        [_dna addObject: [NucleobaseType random]];
    }
    
    return self;
}

-(NSString*) description {
    return [_dna componentsJoinedByString:@""];
}

-(int) hammingDistance:(Cell *)otherCell {
    int distance = 0;
    NSString* myNucleobaceType;
    NSString* otherCellsNucleobaseType;
    
    for (int i = 0; i < size; i++) {
        myNucleobaceType = [_dna objectAtIndex:i];
        otherCellsNucleobaseType = [otherCell.dna objectAtIndex:i];
        if ([myNucleobaceType isEqualToString:otherCellsNucleobaseType] == NO) {
            distance++;
        }
    }
    
    return distance;
}

@end
