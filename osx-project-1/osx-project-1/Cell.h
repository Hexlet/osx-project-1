//
//  Cell.h
//  osx-project-1
//
//  Created by Alexander Sviridov on 03.11.12.
//  Copyright (c) 2012 Alexander Sviridov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *_DNA;
}

@property (nonatomic, readonly) NSMutableArray *DNA;

//Initialize Methods
-(id)initWithCount:(NSInteger)count;
-(id)init;

-(int)hammingDistance:(Cell*)target;

//Get random string from "A", "T", "G", "C"
+(NSString*)getRandomNode;

//Printing array for debuging
-(void)debugPrint;

@end
