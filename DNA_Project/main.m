//
//  main.m
//  Hexlet_DNA
//
//  Created by evgenzh on 10/30/12.
//  Copyright (c) 2012 evgenzh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Cell.h"
int main(int argc, char *argv[])
{
	@autoreleasepool {
		
		NSLog(@"Initialization...");
		
        NSTimeInterval timeBefore = [[NSDate date] timeIntervalSince1970];
        
		Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];
		
		NSLog(@"Cell1: %@", [cell1 getDNA]);
		NSLog(@"Cell2: %@", [cell2 getDNA]);
		
		NSLog(@"Hamming Distance: %d", [cell1 hammingDistance:cell2]);
		
		[cell1 mutate:30];
		[cell2 mutate:80];
		
        NSLog(@"Mutation...");
        
		NSLog(@"Cell1 after mutation: %@", [cell1 getDNA]);
		NSLog(@"Cell2 After mutation: %@", [cell2 getDNA]);
		
		NSLog(@"Hamming Distance after mutation: %d", [cell1 hammingDistance:cell2]);
     
        NSTimeInterval timeAfter = [[NSDate date] timeIntervalSince1970];
        NSLog(@"Time of calculating: %f seconds", timeAfter - timeBefore);
	}
}
