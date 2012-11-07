//
//  Cell.h
//  OSX-DNA
//
//  Created by Pavlo Svirin on 11/3/12.
//  Copyright (c) 2012 Pavlo Svirin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray* DNA;
}
    @property int length;
    -(id) init;
    -(int) hammingDistance: (Cell*) c;
    -(void) print;
@end

@interface Cell (mutator)
    -(void) mutate: (int)position;
    -(NSString*) mutateItem: (NSString*) item_value;
@end