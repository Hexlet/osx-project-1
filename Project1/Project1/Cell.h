//
//  Cell.h
//  Project1
//
//  Created by brevis on 10/31/12.
//  Copyright (c) 2012 brevis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSArray *possibleGenes;
}

@property NSMutableArray *DNA;

-(int)hammingDistance:(Cell *)cell;


@end
