//
//  Cell.h
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CELL_SIZE 100
#define CELL_VALUE_SIZE 4

@interface Cell : NSObject

@property NSMutableArray *DNA;

+(NSArray *) cellValues;
+(NSString *) generateCellValue;
-(void) print;
-(int) hammingDistance:(Cell *)subject;

@end

@interface Cell (Mutator)
- (void) mutate:(int) percent;
@end

@implementation Cell (Mutator)

- (void) mutate:(int) percent {
    int number = CELL_SIZE / 100.0 * percent;
    
    NSMutableArray * indexes = [NSMutableArray arrayWithCapacity:number];
    
    for (int i = 0; i < number; i++) {
        [indexes addObject: [[NSNumber alloc] initWithInt:arc4random_uniform(CELL_SIZE)]];
    }
    
    for (int i = 0; i < number; i++) {
        NSInteger index = [[indexes objectAtIndex:i] integerValue];
        NSString *new_value = [Cell generateCellValue];
        
        while([[self DNA] objectAtIndex:index] == new_value) {
            new_value = [Cell generateCellValue];
        }
        
        [[self DNA] replaceObjectAtIndex:index withObject:new_value];
    }
}

@end