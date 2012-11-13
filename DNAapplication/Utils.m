//
//  Utils.m
//  DNAapplication
//
//  Created by Admin on 11/9/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+(NSUInteger) getRandomNumber:(int)from to:(int)to
{
    return (NSUInteger)from + arc4random()% (to - from + 1);
}

+(id) getRandomComponent:(NSArray *)components
{
    NSUInteger componentIndex = [Utils getRandomNumber:0 to:(int)[components count] -1];
    return [components objectAtIndex:componentIndex];
}

+(NSMutableArray *) getRandom:(int)num numbersOutOf:(int)range
{
    NSMutableArray *numbersArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < range; i++)
    {
        [numbersArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    //shuffle the array to get several uniquie random numbers (first num numbers)
    for (NSUInteger i = 0; i < [numbersArray count]; i++)
    {
        NSUInteger switchIndex = [Utils getRandomNumber:0 to: range-1];
        NSString *bakObject = [NSString stringWithFormat:@"%@",[numbersArray objectAtIndex:i]];
        
        [numbersArray replaceObjectAtIndex:i withObject:[numbersArray objectAtIndex:switchIndex]];
        [numbersArray replaceObjectAtIndex:switchIndex withObject:bakObject];
    }
    
    NSMutableArray *collectedNumbers = [[NSMutableArray alloc] init];
    
    //collect unique numbers
    for (NSUInteger i = 0; i < num; i++)
    {
        [collectedNumbers addObject:[numbersArray objectAtIndex:i]];
    }
    
/*    
    NSMutableString *out = [[NSMutableString alloc] init];
    
    for (NSInteger i = 0; i < [collectedNumbers count]; i++)
    {
        NSMutableString *tempString = [NSMutableString stringWithFormat:@"%@ ", [collectedNumbers objectAtIndex:i]];
        [out appendString:tempString];
    }
    
    NSLog(@"%@", out);
*/
    
    return numbersArray;
}

@end
