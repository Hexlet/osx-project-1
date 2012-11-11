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
@property NSMutableArray *secondDNA;

-(id)init;
-(int)hammingDistance:(Cell *) cell;
//-(NSMutableArray *)getDNA;

@end

//создаем категорию mutator класса Cell
@interface Cell(mutator)
-(void)mutate: (int)x;
@end