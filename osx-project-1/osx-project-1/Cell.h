//
//  Cell.h
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LENGTH 100

@interface Cell : NSObject

    @property (readonly) NSMutableArray *DNA;
    @property (readonly) NSArray *nucleobases;

    -(int)hammingDistance: (Cell *)cell;
@end
