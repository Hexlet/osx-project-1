//
//  Cell.h
//  SimpleCell
//
//  Created by Dmitry Svetlakov on 11/2/12.
//  Copyright (c) 2012 Dmitry Svetlakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSArray *avaiableKeys;
}

extern const int MAX_ITEMS;
@property NSMutableArray *DNA;

- (id) initWithGeneratedDNA;

- (int)hammingDistance:(Cell *)comparedCell;

@end
