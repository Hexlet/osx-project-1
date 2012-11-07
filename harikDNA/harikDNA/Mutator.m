#import "Mutator.h"


@implementation Cell (Mutator)


-(void) mutate: (int) n {

	if (n>100 || n<0) return;
	
	NSMutableArray* arrIndex = [[NSMutableArray alloc] init];
	
	for (int i=0; i <DNA_LENGTH; i++) {
		[arrIndex addObject: [NSNumber numberWithInt:i]];
	}
	
	
	for (int i=0; i<floor(n*DNA_LENGTH/100); i++) 
	{
		int indexForMutate, indexNucleotides, indexNew;
		
		indexForMutate = arc4random()%[arrIndex count];// arc4random_uniform([arrIndex count]);
		
		indexNucleotides = (int)[nucleotides indexOfObject: [self.DNA objectAtIndex:[[arrIndex objectAtIndex:indexForMutate]intValue]]]; // omg
		
		indexNew = (indexNucleotides+1 + arc4random_uniform(2)) %  [nucleotides count];
        
        [self.DNA replaceObjectAtIndex:[[arrIndex objectAtIndex:indexForMutate]intValue]
                      withObject:[nucleotides objectAtIndex:indexNew]];
		
		[arrIndex removeObjectAtIndex:indexForMutate];
	}
}


@end