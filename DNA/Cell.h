//
//  Cell.h
//  DNA
//
//  Created by Volodymyr Ratushny on 04.11.12.
//  Copyright (c) 2012 Volodymyr Ratushny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (nonatomic, strong) NSMutableArray *DNA;

-(int)hammingDistance:(Cell *)cell;
@end

@interface Cell(mutator)
-(void)mutate:(int)mutatingPositionsCount;
@end