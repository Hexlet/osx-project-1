//
//  main.h
//  DNAProject
//
//  Created by VITALIY NESTERENKO on 05.11.12.
//  Copyright (c) 2012 VITALIY NESTERENKO. All rights reserved.
//

#ifndef DNAProject_main_h
#define DNAProject_main_h

#import <Foundation/Foundation.h>


@interface Cell : NSObject

-(int)getRandomNumber:(int)from to:(int)to;
-(void)getRandomSequence:(int)from to:(int)to count:(int)count sequnce:(int *)sequence;

- (NSString *) randomNucleotide;
- (int) hammingDistance:(Cell *)other_cell;
-(NSString *) asString;
@property NSMutableArray * DNA;
@end


@interface Cell (mutator)
@end


#endif
