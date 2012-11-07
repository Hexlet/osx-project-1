
#import "Cell.h"

@implementation Cell 

-(id) init {
    self = [super init];
    if (self) {	
	_DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
	
	for (int i = 0 ; i < DNA_LENGTH; i++) {
		[_DNA addObject: [nucleotides objectAtIndex:arc4random_uniform(3)]];
	}
    }
    
    return self;
}

-(int) hammingDistance: (Cell *) cell{
	int difference = 0;
	for (int i = 0 ; i < DNA_LENGTH; i++) {
		if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i])
			difference++;   
	}
	return difference;
}


@end