//
//  main.m
//  ProjectDNA
//
//  Created by Admin on 10/30/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void) mutate:(int) x;
@end

@implementation Cell (Mutator)
-(void) mutate:(int) x{
    //array with values for replacement
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    //array to keep mutated positions
    NSMutableArray *mutated = [[NSMutableArray alloc] init];
    NSMutableArray *newDNA = self.DNA;
    int i=0;
    int num;
    id newValue;
    id oldValue;
    NSNumber *nsNum;
    // if we want to change more than 100 values
    // will change the reminder of 100 and post a warning
    if (x>100){
        x=x%100;
        NSLog(@"Too much cells to mutate! Will mutate %i instead.",x);
    }
    do{
        //a random number is picked
        num = arc4random() % 100;
        oldValue = [newDNA objectAtIndex:num];
        nsNum = [NSNumber numberWithInt:(num)];
        //check if this value was mutated already
        if (![mutated containsObject: nsNum]) {
            //if not, picking a new different value
            do {
                newValue = [arr objectAtIndex:(arc4random()%4)];
            } while (newValue==oldValue);
            //replace the value with a new one
            //add this number to "mutated" array
            //and increment counter
            [newDNA replaceObjectAtIndex:num withObject:newValue];
            [mutated addObject:nsNum];
            i++;
        }
    }while (i<x);
    self.DNA = newDNA;
}

@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell=[[Cell alloc] init], *anotherCell=[[Cell alloc] init];
        int num = [firstCell hammingDistance:anotherCell];
        NSLog(@"Distance before mutation:%i",num);
        [firstCell mutate:10];
        [anotherCell mutate:15];
        num = [firstCell hammingDistance:anotherCell];
        NSLog(@"Distance after mutation:%i",num);
    }
    return 0;
}

