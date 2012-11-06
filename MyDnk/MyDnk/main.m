//
//  main.m
//  MyDnk
//
//  Created by Михаил Субботин on 03.11.12.
//  Copyright (c) 2012 Михаил Субботин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(DNAOperation)
-(void) mutate: (int) number;
@end

@implementation Cell(DNAOperation)
-(void) mutate:(int)number{
    NSMutableArray* marray = [[NSMutableArray alloc] init]; // массив с номерами изменяемых элементов
    for (int i =0; i < number; i++){
        int newElement = rand() % 100;
        while ([marray containsObject: [NSString stringWithFormat:@"%d", newElement]]) //проверяем существует такой элемент
            newElement = rand() % 100;
        [marray addObject:[NSString stringWithFormat:@"%d", newElement]];
    }
    [marray sortUsingSelector:@selector(caseInsensitiveCompare:)];
    for (int i = 0; i < [self.DNA count]; i++)
    {
        if ([marray containsObject: [NSString stringWithFormat:@"%d", i]])
        {
            NSString* element = [self generateElement];
            NSString* DNAelement = [NSString stringWithFormat:@"%@",[self.DNA objectAtIndex:i]];
            while(DNAelement == element)
                element = [self generateElement];
            [self.DNA replaceObjectAtIndex:i withObject:element];
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance = %i", [cell1 hammingDistance:cell2]);
        [cell2 mutate: 10];
        [cell1 mutate: 30];
        NSLog(@"hamming distance = %i", [cell1 hammingDistance:cell2]);
       
    }
    return 0;
}

