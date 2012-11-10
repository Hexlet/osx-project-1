//
//  Cell.h
//  Project1 - DNA
//
//  Created by Dennis Dmitriev on 10.11.12.
//  Copyright (c) 2012 Dennis Dmitriev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
     NSMutableArray *DNA; }

@property (readonly) NSArray *Tags;
-(NSString*) GetDNAItemAtIndex: (int) index;
-(int) hammingDistance:(Cell*) a;
-(void) print;

@end
