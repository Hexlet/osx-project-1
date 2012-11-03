//
//  main.m
//  DNAProject
//
//  Created by cso on 03.11.2012.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void) mutate: (int)nMutations;
@end

@implementation Cell (mutator)

- (void) mutate:(int)nMutations
{
	if (nMutations > [DNA count])
	{
		NSLog(@"Mutations number should be less than: %li", [DNA count]);
		return;
	}
	
	NSMutableArray* mudatedDNAs = [[NSMutableArray alloc] init]; //Already mutated items of DNA

	NSNumber* nRandom = [[NSNumber alloc] initWithInt: arc4random() % ([DNA count] - 1)];
	
	for (int i = 0; i < nMutations; ++i)
	{
		//if i is in mudated items get new number
		while ( [mudatedDNAs containsObject: nRandom] )
			nRandom = [[NSNumber alloc] initWithInt: arc4random() % ([DNA count] - 1)];

		NSString* sCellCode = [DNA objectAtIndex: [nRandom intValue]];
		NSString* sNewCellCode = [self getRandomCellCode];
		//random cell code can be the same as existing one, so we should check until it become unique
		while ([sCellCode isEqualToString: sNewCellCode])
			sNewCellCode = [self getRandomCellCode];
		
		[DNA replaceObjectAtIndex: [nRandom intValue] withObject: sNewCellCode];
		//add mutated item number to array
		[mudatedDNAs addObject: nRandom];
	}
}

@end

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		Cell* myCell1 = [[Cell alloc] initWithDefaultCodes];
		Cell* myCell2 = [[Cell alloc] initWithDefaultCodes];
		
		NSLog(@"Hamming distance before mutation = %i", [myCell1 hammingDistance: myCell2]);
		
		int nDNACount = [[myCell1 getDNA] count];
		[ myCell1 mutate: arc4random() % ( nDNACount - 1 ) ];
		[ myCell2 mutate: arc4random() % ( nDNACount - 1 ) ];
		
		NSLog(@"Hamming distance after mutation = %i", [myCell1 hammingDistance: myCell2]);
		

			    
	}
    return 0;
}

