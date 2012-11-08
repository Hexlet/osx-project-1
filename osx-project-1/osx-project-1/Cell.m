//
//  Cell.m
//  osx-project-1
//
//  Created by Alexander Sviridov on 03.11.12.
//  Copyright (c) 2012 Alexander Sviridov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA = _DNA;

-(id)initWithCount:(NSInteger)count
{
    self = [super init];
    if (self)
    {
        _DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < count; i++)
            [_DNA addObject:[Cell getRandomNode]];
    }
    return self;
}

-(id)init
{
    return [self initWithCount:100];
}

-(int)hammingDistance:(Cell*)target
{
    NSInteger targetLength = [[target DNA] count];
    NSInteger selfLength = [[self DNA] count];
    
    //in case, where self DNA array and target DNA array have different count of objects
    //that different will be counted as hamming distance
    int result = abs( (int)(targetLength - selfLength));
    
    for ( int i = 0; (i < targetLength ) && (i < selfLength); ++i)
    {
        //test objects of array
        if ( ( ![[[self DNA] objectAtIndex:i] isKindOfClass:[NSString class]] ) ||
            (![[[target DNA] objectAtIndex:i] isKindOfClass:[NSString class]]))
            @throw [NSException exceptionWithName:@"CellHamming1" reason:@"were found object of DNA array, with type not like NSString" userInfo:nil];
        
        if ( !( [(NSString*)[[self DNA] objectAtIndex:i] isEqualToString:[[target DNA] objectAtIndex:i]] ))
            result++;
    }
    
    return result;
}

-(void)dealloc
{
    [_DNA release];
    [super dealloc];
}

+(NSString*)getRandomNode
{
    switch (random() % 4) {
        case 0:
            return @"A";
        case 1:
            return @"T";
        case 2:
            return @"G";
    }
    return @"C";
}

-(void)debugPrint
{
    NSString *result = [NSString string];
    for (id node in _DNA)
    {
        if ( [node isKindOfClass:[NSString class]] )
            result = [result stringByAppendingString:node];
    }
    NSLog(@"%s [%@]", __PRETTY_FUNCTION__, result);
}

@end
