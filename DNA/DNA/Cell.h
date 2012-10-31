//
//  Cell.h
//  DNA
//
//  Created by Kirill Ragozin on 10 / 31 / 12.
//  Copyright (c) 2012 Kirill Ragozin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CAPACITY 100

@interface Cell : NSObject {
    NSMutableArray *DNA;
    @private NSArray *source;
}

-(id)DNA;
-(int)hammingDistance:(Cell*)cell;
+(int)hammingDistanceBetween:(Cell*)cell1 and:(Cell*)cell2;

@end
