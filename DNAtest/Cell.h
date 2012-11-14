//
//  Cell.h
//  DNAtest
//
//  Created by herku on 11/14/12.
//  Copyright (c) 2012 herku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

@property NSArray *DNA; 

-(int)hammingDistance:(Cell *)HD;

@end
