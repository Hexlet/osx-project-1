//
//  Cell.h
//  osx-project-1
//
//  Created by Ivan Kuzmin on 11/5/12.
//  Copyright (c) 2012 Ivan Kuzmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

    @property NSMutableArray *DNA;
    @property NSArray *nucleobases;

    -(int)hammingDistance: (Cell *)cell;
@end
