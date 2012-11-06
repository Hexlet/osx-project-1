//
//  main.m
//  DNA
//
//  Created by Pavel Pevnitskiy on 11/5/12.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool
	{

		Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];

		NSLog(@"Hamming distance before mutation: %i", [cell1 hammingDistance:cell2]);

		[cell1 mutate:30];
		[cell2 mutate:80];

		NSLog(@"Hamming distance after mutation: %i", [cell1 hammingDistance:cell2]);

	}
    return 0;
}

