//
//  Cell.m
//  DNA
//
//  Created by Volodymyr Ratushny on 04.11.12.
//  Copyright (c) 2012 Volodymyr Ratushny. All rights reserved.
//

#import "Cell.h"

@interface Cell(private)
+(NSArray *)dnaValues;
+(NSString *)getRandomDNAValue;
+(NSString *)getRandomDNAValue: (NSString *)exclude;
@end

@implementation Cell(private)

+(NSArray *)dnaValues {
    static NSArray *foo = nil;
    if (foo == nil) {
        foo = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return foo;
}

+(NSString *)getRandomDNAValue {
    return [[Cell dnaValues] objectAtIndex:arc4random() % [[Cell dnaValues] count]];
}

+(NSString *)getRandomDNAValue: (NSString *)exclude {
    NSString *randomValue = [Cell getRandomDNAValue];
    if ([randomValue isEqualTo:exclude]) {
        randomValue = [Cell getRandomDNAValue:exclude];
    }
    return randomValue;
}

@end


@implementation Cell(mutator)
-(void)mutate:(int)percents {
    NSMutableArray *randomArray = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i = 0; i < 100; i++)
        [randomArray addObject:[[NSNumber alloc] initWithInt:i]];
    for (int i = 0; i < randomArray.count; i++) {
        int n = arc4random() % randomArray.count;
        [randomArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    for (int i = 0; i < percents; i++) {
        int idx = [[randomArray objectAtIndex:i] intValue];
        NSString *exclude = [[self DNA] objectAtIndex:idx];
        [[self DNA] setObject:[Cell getRandomDNAValue:exclude] atIndexedSubscript:idx];
    }
}
@end


@implementation Cell

-(id)init {
    self = [super init];
    
    for (int i = 0; i < 100; i++) {
        [[self DNA] addObject:[Cell getRandomDNAValue]];
    }
    
    return self;
}



-(NSMutableArray *)DNA {
    if (_DNA == nil) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return _DNA;
}
-(int)hammingDistance:(Cell *)cell {
    int distance = 0;
    for (int i = 0; i < [[self DNA] count]; i++) {
        distance += [[[self DNA] objectAtIndex:i] isEqualTo:[[cell DNA] objectAtIndex:i]]? 0: 1;
    }
    return distance;
}

@end
