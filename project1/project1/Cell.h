//
//  Cell.h
//  project1
//
//  Created by Василий Слепцов on 01.11.12.
//  Copyright (c) 2012 Василий Слепцов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *objects;
    int Length;
}
@property NSMutableArray *DNA;
-(int)hammingDistance: (Cell*) hamm;
-(NSString*) getRandom;
@end
