//
//  Cell.h
//  pr1dna
//
//  Created by админ on 11.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}


-(int) hammingDistance: (Cell*) myCell;
-(NSString *) getLetter;

@end
