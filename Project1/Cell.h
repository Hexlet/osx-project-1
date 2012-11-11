//
//  Cell.h
//  Project1
//
//  Created by Olga on 02.11.12.
//  Copyright (c) 2012 Olga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSArray *DNAElements;
    NSMutableArray *DNA;
}


-(id)init;
-(int)hammingDistance:(Cell *) cell;
-(NSMutableArray*)secondDNA;

@end

//создаем категорию mutator класса Cell
@interface Cell(mutator)
-(void)mutate: (int)x;
@end