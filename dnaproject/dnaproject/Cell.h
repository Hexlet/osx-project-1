//
//  Cell.h
//  dnaproject
//
//  Created by Grisha Silver on 05.11.12.
//  Copyright (c) 2012 Grisha Silver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA ;
    int r;
    NSString *v;
}
-(int)hammingDistance:(Cell*)cell;

@end
