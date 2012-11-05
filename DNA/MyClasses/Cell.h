//
//  Cell.h
//  DNA
//
//  Created by Buxxter on 05.11.12.
//  Copyright (c) 2012 Buxxter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *mDNA; // Здесь будем хранить цепочку ДНК (Массив из 100 символов, каждый из них равен A, T, G или C)
@property (readonly) NSMutableString *mStringView;

-(id) init;
-(int) hammingDistance:(Cell*) otherCell;
-(void) createStringView;

@end

@interface Cell (mutator)

-(Cell*) mutateOn:(uint)percents;

@end