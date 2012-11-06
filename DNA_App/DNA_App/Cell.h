//
//  Cell.h
//  DNA_App
//
//  Created by Anton Stepanov on 05.11.12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(id) init: (int) count;
-(int) hammingDistance: (Cell*) cell;
-(void) showDNA;

@end
