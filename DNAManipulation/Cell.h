//
//  Cell.h
//  DNAManipulation
//
//  Created by MapC on 06.11.12.
//  Copyright (c) 2012 wiifit. All rights reserved.
//

#import <Foundation/Foundation.h>
//Определение количества элементов DNA (по условию задачи)
#define DNA_LENGTH 100

@interface Cell : NSObject
@property (readonly) NSMutableArray *DNA;
-(int) hammingDistance: (Cell *) c;
@end
