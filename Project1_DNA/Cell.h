//
//  Cell.h
//  Project1_DNA
//
//  Created by Alexander on 06.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//
#define countDNA 100

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSArray *variety;
}
@property NSMutableArray *DNA;
-(int)hammingDistance:(Cell*)cell;
@end



@interface Cell (mutator)
-(void)mutator:(int)percent;
@end

@implementation Cell (mutator)
-(void)mutator:(int)percent
{
    NSMutableIndexSet *path = [[NSMutableIndexSet alloc]init];
    
    int _percent = (countDNA / 100) * percent;
    while ([path count] < _percent) {
        [path addIndex:(arc4random() % countDNA)];
    }
    
    [path enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        @autoreleasepool {
            NSString *tempString = [NSString stringWithString:[self.DNA objectAtIndex:idx]];
            while ([[self.DNA objectAtIndex:idx] isEqual:tempString]) {
                [self.DNA setObject:[variety objectAtIndex:arc4random()%[variety count]] atIndexedSubscript:idx];
            }
        }
    }];
    
}
@end