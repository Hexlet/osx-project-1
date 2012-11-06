//
//  Cell.h
//  DNA
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void) printDNA;
-(int) hammingDistance:(Cell*)nDNA;


@end
