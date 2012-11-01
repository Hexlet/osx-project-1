//
//  main.m
//  DNA
//
//  Created by Aliaksandr Minets on 10/31/12.
//  Copyright (c) 2012 minchik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
    
    -(void) mutate: (int) f;

@end

@implementation Cell (Mutator)

-(void) mutate:(int)f{
    NSNumber *cell_to_modify = 0;
    NSString *new_cell_name = [[NSString alloc] init];
    NSMutableSet * modifiedCells = [[NSMutableSet alloc] init];
    int new_cell_type;
    while (f!=0) {
        cell_to_modify = [NSNumber numberWithInt:(arc4random() % 100)];
        if ([modifiedCells containsObject:cell_to_modify]){
            continue;
        }
        [modifiedCells addObject:cell_to_modify];
        f -= 1;
        
        new_cell_type = arc4random() % 4;
        
        switch (new_cell_type) {
            case 0:
                new_cell_name = @"A";
                break;
            case 1:
                new_cell_name = @"T";
                break;
            case 2:
                new_cell_name = @"G";
                break;
            default:
                new_cell_name = @"C";
                break;
        }
        [dna replaceObjectAtIndex:[cell_to_modify intValue] withObject:new_cell_name];
        
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        //NSLog(@"%@", [firstCell getDna]);
        //NSLog(@"%@", [secondCell getDna]);
        
        NSLog(@"%i",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:50];
        [secondCell mutate:50];
        
        NSLog(@"%i", [firstCell hammingDistance:secondCell]);
        
        //NSLog(@"%@", [firstCell getDna]);
        //NSLog(@"%lu", [[firstCell getDna] count]);

        
    }
    return 0;
}

