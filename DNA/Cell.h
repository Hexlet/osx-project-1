//
//  Cell.h
//  DNA
//
//  Created by Kirill Beletskiy on 11/2/12.
//  Copyright (c) 2012 Kirill Beletskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
    @property NSMutableArray *DNA;

-(void) printDNA;

@end
