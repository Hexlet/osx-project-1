//
//  Cell.h
//  osx-project-1
//
//  Created by Victor Mylcin on 09.11.12.
//  Copyright (c) 2012 Victor Mylcin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH 100 // длина массива DNA

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(int)hammingDistance: (Cell *)testCell;
-(NSString *)getByIndex: (int)index;
@end
