//
//  Cell.h
//  osx-project-1
//
//  Created by Maxim Zhukov on 05.11.12.
//  Copyright (c) 2012 Maxim Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(id) initWithMoleculeLength:(int) length;
-(NSMutableArray *) generateDNA:(long int) length;
-(NSString *) getRandomMolecule;
-(int) getRandomNumber:(NSUInteger) length;
-(int) hammingDistance:(Cell *) cell;
-(void) print;

@end
