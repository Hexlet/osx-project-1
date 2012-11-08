//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by Alexander Sviridov on 03.11.12.
//  Copyright (c) 2012 Alexander Sviridov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int)percent
{
    NSArray *indexesToChange;
	int count = [[self DNA] count] * percent / 100;
    
    //we can't change more values that we have
    if ( count > [[self DNA] count] || count < 0)
        @throw [NSException exceptionWithName:@"CellMutatorException1" reason:@"Incorrect input parameter" userInfo:nil];
    
    //indexesToChange is array of indexes for change objects in our DNA array
    indexesToChange = [self getRandomIndexes:count];
    
    //change cycle, were we change one value to enother
    for (NSNumber *changeIndex in indexesToChange )
        [_DNA replaceObjectAtIndex:[changeIndex integerValue]
                        withObject:[self getRandomNodeNotEqualToNode:[_DNA objectAtIndex:[changeIndex integerValue]]]];
}

#pragma mark -
#pragma mark Private

//returns array of random indexes
//countOfIndexes is parameter, how mutch indexes from DNA array returns
-(NSArray*)getRandomIndexes:(int)countOfIndexes
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for ( int i = 0; i < countOfIndexes; ++i )
    {
        NSInteger randomIndex;
        do {
            randomIndex = rand() % [_DNA count];
		} while ( [temp containsObject:[NSNumber numberWithInteger:randomIndex]] );
        [temp addObject:[NSNumber numberWithInteger:randomIndex]];
    }
    NSArray *result = [NSArray arrayWithArray:temp];
    [temp release];
    return result;
}

//Returns Node with another value from input paramether
-(NSString*)getRandomNodeNotEqualToNode:(NSString*)node
{
    NSString *result;
    if ( ![node isKindOfClass:[NSString class]])
        @throw [NSException exceptionWithName:@"CellMutatorException2"
                                       reason:@"were found input parameter with type not like NSString" userInfo:nil];
    do {
        result = [Cell getRandomNode];
    } while ( [result isEqualToString:node] );
    return result;
}

@end
