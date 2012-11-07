//
//  Cell.h
//  DNA-Project
//
//  Created by Dmitry on 01.11.12.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;
    int i;
}
-(id) init;
-(int) hammingDistance:(Cell *) cell;
-(NSString*) makeGen;

-(NSMutableArray*) getDNA;
-(void) setDNA:(NSMutableArray *) newDNA;

+(Cell *) copyCell:(Cell*) sourceCell;
@end
