//
//  Cell.h
//  Dna
//
//  Created by conference on 22.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *dnaArray;
    NSArray *dnaBitsArray;
    BOOL maskArray[100];
    int size;
}

-(int) hammingDistance:(Cell*)obj;
-(NSString*) getObj:(int)index;


@end
