//
//  Cell.h
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}


-(void)hammingDistance;

@end
