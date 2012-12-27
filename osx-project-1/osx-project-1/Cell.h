//
//  Cell.h
//  osx-project-1
//
//  Created by Murat Temirov on 26.12.12.
//  Copyright (c) 2012 Murat Temirov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    int dnaLenght;
}
@property NSMutableArray *dna;


-(int) hammingDistance:(Cell*) myCell;
-(id) generateChar;
@end
