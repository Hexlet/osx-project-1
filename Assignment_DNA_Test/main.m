//
//  main.m
//  Assignment_DNA_Test
//
//  Created by Pasha Ortish on 10/31/12.
//  Copyright (c) 2012 Pasha Ortish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// point number 6 - creating CATEGORY "mutator" in order to replace "X" elements in DNA1 and DNA2 arrays.

@interface Cell (mutator)

-(void)mute:(int)x;

@end

@implementation Cell (mutator)

-(void)mute:(int)x
{
    NSLog(@" ================= The MUTATION FACTOR is %i percensts ==========",x);
    NSLog(@" ");
    
// creating an tempArray to save "x" DIFFERENT (unique) RANDOM numbers and replacing the particular cells in DNA1  Array        
    NSMutableArray *tempArr1 = [NSMutableArray arrayWithCapacity:x];
    int uniqueNumber1;
    while ([tempArr1 count]< x)
    {
        uniqueNumber1 = arc4random() % (self.theDNAchainLength);
        if (![tempArr1 containsObject:[NSNumber numberWithInt:uniqueNumber1]])
        {
        NSLog(@" The elements of DNA1 Array  will be randomly replaced at address:%i ", uniqueNumber1);
        [tempArr1 addObject:[NSNumber numberWithInt: uniqueNumber1]];
        [self.DNA1 replaceObjectAtIndex:uniqueNumber1 withObject:[NSString stringWithFormat:@"%C",[self.symbols characterAtIndex:(arc4random() % (4))]]];
        }
    }
    
 NSLog(@"================================================================");
    // creating an tempArray to save "x" DIFFERENT (unique) RANDOM numbers and replacing the particular cells in DNA2  Array
    NSMutableArray *tempArr2 = [NSMutableArray arrayWithCapacity:x];
    int uniqueNumber2;
    while ([tempArr2 count]< x)
    {
        uniqueNumber2 = arc4random() % (self.theDNAchainLength);
        if (![tempArr2 containsObject:[NSNumber numberWithInt:uniqueNumber2]])
        {
            NSLog(@" The elements of DNA2 Array  will be randomly replaced at address:%i ", uniqueNumber2);
            [tempArr2 addObject:[NSNumber numberWithInt: uniqueNumber2]];
            [self.DNA2 replaceObjectAtIndex:uniqueNumber2 withObject:[NSString stringWithFormat:@"%C",[self.symbols characterAtIndex:(arc4random() % (4))]]];
        }
    }
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool
{
// point number 8 - creating "Cell" object (I found no reason to create two objects).
    
        Cell *myCell;
        myCell = [[Cell alloc]init];

// point number 5 - calling "hammingDistance" method by passing the object "myCell".
    
    int i = [myCell hammingDistance:myCell];
    NSLog(@"The HammingDistance BEFORE MUTATION is: %i",i);
    NSLog(@" ");
    NSLog(@"================================================================");
    NSLog(@"===================The DNA sequencing AFTER MUTATION============");
    
    [myCell mute:myCell.theMutationFactor];
    for (int count = 0 ; count < myCell.theDNAchainLength; count++)
    {
    NSLog(@"The RANDOM DNA1 and DNA2 sequencing  %i AFTER MUTATION is: %@ and %@ ",count+1,[myCell.DNA1 objectAtIndex:count],[myCell.DNA2 objectAtIndex:count]);
    }
    
    int iMutate = [myCell hammingDistance:myCell];
    NSLog(@"The HammingDistance AFTER MUTATION is: %i",iMutate);
    NSLog(@"================================================================");
    NSLog(@"=======================END OF THE PROGRAM=======================");
    
         }
    return 0;
}

