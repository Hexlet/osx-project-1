//
//  main.m
//  Project1_DNA
//
//  Created by Vladimir Koltunov on 04.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutate)

-(void) mutate:(int) percent;
@end

@implementation Cell (Mutate)

-(void) mutate:(int)percent{
    
    NSLog(@"----------------MUTATION START--------------------");
    int rndIndex=0;
    int repeat = 0;
    int rnd;
    
    
    NSString *tmpString;
    NSMutableArray *links = [NSMutableArray arrayWithCapacity: percent];
    
    for (int i=0; i<percent; i++) {
        rndIndex = arc4random()%100;
        
        tmpString = [NSString stringWithFormat:@"%i", rndIndex];
        
        if([links containsObject:tmpString]){
            //NSLog(@"Recompile");
            repeat++;
            i--;
        } else {
            rnd = arc4random()%4;
            if([DNA objectAtIndex:rndIndex] != [template objectAtIndex:rnd]){
                //NSLog(@"Old value = %@ ==> %@",
                //      [DNA objectAtIndex:rndIndex],
                //      [template objectAtIndex:rnd]);
                [DNA replaceObjectAtIndex:rndIndex withObject:[template objectAtIndex:rnd]];
                [links addObject:tmpString];                
            }else{
                repeat++;
                i--;
            }
            
        }
        
        //NSLog(@"Increment %i",i);
        
    }
    NSLog(@"REPEATS = %i", repeat);
    NSLog(@"----------------MUTATION FINISHED-----------------");
}

@end
    


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell printDNA];
        [cell2 printDNA];
        
        int mutIndex = [cell hummingDistance:cell2];
        NSLog(@"RESULT = %i",mutIndex);
        
        [cell mutate:50];
        [cell2 mutate:50];
        
        NSLog(@"NEW RESULT = %i", [cell hummingDistance:cell2]);
    }
    return 0;
}

