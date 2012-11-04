//
//  Cell.h
//  Human DNA
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

-(void) DNA:(int) d;
-(id) init;
-(int) hammingDistance:(Cell *) numericHamming;
@end


@interface Cell ()

-(void) mutator:(int)precentOfSymbols;
@end