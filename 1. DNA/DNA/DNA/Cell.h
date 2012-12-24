//
//  Cell.h
//  DNA
//
//  Created by Elena Grasovskaya on 12/24/12.
//  Copyright (c) 2012 Sergey Grasovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
       
    int capacity;
    NSString* name;
    
//@public
    NSArray * arNukl;
    NSMutableArray * dna;
}

@property (readonly) int capacity;
@property NSString* name;

-(int)hammingDistance:(Cell*) cell;
-(void)createDNA;
-(void)print;
-(NSString*) dnaAtIndex:(int)index;



@end
