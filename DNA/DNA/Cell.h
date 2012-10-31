//
//  Cell.h
//  DNA
//
//  Created by Dastar Ron on 10/31/12.
//  Copyright (c) 2012 Dastar Ron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 

-(void) print;
-(NSMutableArray *) getDNA;
-(int) hammingDistance: (Cell *)fromDNA;
-(void) replaceWith: (Cell *)array;
@end
