//
//  Cell.h
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA;
    -(int) hammingDistance: (Cell *)c;

@end

@interface Cell (mutator)
- (void)mutate:(int) percentM;
@end