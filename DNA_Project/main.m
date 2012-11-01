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
		
		Cell *cell1 = [[Cell alloc] init];
		Cell *cell2 = [[Cell alloc] init];
		
		NSLog(@"Cell1: %@", [cell1 getDNA]);
		NSLog(@"Cell2: %@", [cell2 getDNA]);
		
		NSLog(@"Hamming Distance: %d", [cell1 hammingDistance:cell2]);
		
		[cell1 mutate:60];
		[cell2 mutate:50];
		
		NSLog(@"Cell1 After Mutation: %@", [cell1 getDNA]);
		NSLog(@"Cell2 After Mutation: %@", [cell2 getDNA]);
		
		NSLog(@"Hamming Distance After Mutation: %d", [cell1 hammingDistance:cell2]);
	}
}
