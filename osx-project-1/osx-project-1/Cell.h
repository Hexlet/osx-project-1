//
//  Cell.h
//  osx-project-1
//
//  Created by Аня&Саша on 06.11.12.
//  Copyright (c) 2012 nogaav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *DNA;
-(int)hammingDistance:(Cell*) otherCell;
-(id)getRandomSymbol;
-(NSMutableString*)getString;
@end
